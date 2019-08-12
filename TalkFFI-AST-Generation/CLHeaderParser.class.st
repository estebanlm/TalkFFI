"
FFIGenerator converts the Clang AST of a header file into smalltalk objects instances of subclasses of CLNode.

it supports incomplete type declaration for structures.

it does not support function overloading for now.

its main usage scenario is:

FFIGenerator new
	headerFile: '/Users/ciprian/Playfield/llvm-3.1/install_clang-x86/include/clang-c/Index.h';
	addOption: '-I/Users/ciprian/Playfield/llvm-3.1/install_clang-x86/include/clang/include';
	generateFFI.
"
Class {
	#name : #CLHeaderParser,
	#superclass : #Object,
	#instVars : [
		'headerFile',
		'compilationOptions',
		'singleFile',
		'functions',
		'types',
		'unmappable',
		'builder',
		'tu',
		'functionFilterBlock',
		'functionFilter'
	],
	#category : 'TalkFFI-AST-Generation'
}

{ #category : #'instance creation' }
CLHeaderParser class >> builder: aBuilder [
	^ self new builder: aBuilder
]

{ #category : #'as yet unclassified' }
CLHeaderParser class >> clangTypeToProcessorSymbol [
	| map |
	map := Dictionary new.
	map add: #CXType_Unexposed -> #unexposed:.	
	map add: #CXType_Typedef -> #typedef:.
	map add: #CXType_Enum -> #enum:.
	map add: #CXType_Pointer -> #pointer:.
	map add: #CXType_Record -> #record:.
	map add: #CXType_FunctionProto -> #function:.
	map add: #CXType_FunctionNoProto -> #function:.
	map add: #CXType_ConstantArray -> #constantArray:.
	
	map add: #CXType_BlockPointer -> #unsupported:. 
	map add: #CXType_Complex -> #unsupported:.
	map add: #CXType_LValueReference -> #unsupported:.
	map add: #CXType_RValueReference -> #unsupported:.
	map add: #CXType_ObjCInterface -> #unsupported:.
	map add: #CXType_ObjCObjectPointer -> #unsupported:.
	map add: #CXType_Vector -> #unsupported:.
	
	map add: #CXType_Elaborated -> #unexposed:.
	
	^ map
]

{ #category : #'instance creation' }
CLHeaderParser class >> new [
	^ super new initialize
]

{ #category : #adding }
CLHeaderParser >> addOption: anOptionString [
	compilationOptions  add: anOptionString.
]

{ #category : #accessing }
CLHeaderParser >> builder [
	^ builder
]

{ #category : #accessing }
CLHeaderParser >> builder: anObject [
	builder := anObject
]

{ #category : #'accessing-libclang' }
CLHeaderParser >> childVisitContinue [
	^ CXChildVisitResultEnum CXChildVisit_Continue
]

{ #category : #accessing }
CLHeaderParser >> compilationOptions [
	^ compilationOptions
]

{ #category : #accessing }
CLHeaderParser >> compilationOptions: anObject [
	compilationOptions := anObject
]

{ #category : #'private type builders' }
CLHeaderParser >> constantArray: aType [
	^ builder
		arrayNamed: (self typeName: aType)
		elementType: (self visitType: aType arrayElementType)
		size: aType arraySize
		sourceLocation: (self typeLocation: aType)
]

{ #category : #'private api' }
CLHeaderParser >> convertHeader [
	| idx |
	tu isNil
		ifTrue: [ 
			idx := self indexClass default.
			tu := idx translationUnitFromSource: self headerFile options: compilationOptions ].
	TalkFFIAnnouncer uniqueInstance announce: (CLHeaderLoaded header: self headerFile diagnostics: tu diagnosticSet).
	tu cursor visitChildren: self functionsVisitor.
	^ builder
		headerNamed: self headerFileName
		types: self types
		functions: self functions
		unmappable: unmappable
		sourceLocation:
			{(self headerFile).
			0.
			0}
]

{ #category : #'accessing-libclang' }
CLHeaderParser >> cursorVisitorClass [
	^ CXCursorVisitorCb 
]

{ #category : #accessing }
CLHeaderParser >> defaultFilterBlock [
	^ [ :file :cursor | 
	singleFile
		ifTrue: [ cursor location presumedLocation first = file ]
		ifFalse: [ true ] ]
]

{ #category : #'private type builders' }
CLHeaderParser >> enum: aType [
	| callback enum |
	enum := builder
		enumNamed: (self typeName: aType)
		type: (self visitType: aType declaration enumType)
		sourceLocation: (self typeLocation: aType).
	callback := self cursorVisitorClass 
		on: [ :cursor :parent :data | 
			builder enum: enum at: cursor spelling put: cursor enumValue.
			self childVisitContinue ].
	aType declaration visitChildren: callback.
	^ enum
]

{ #category : #api }
CLHeaderParser >> everything [
	singleFile := false.
]

{ #category : #'private type builders' }
CLHeaderParser >> function: aType [
	| returnType arguments fctCursor |
	returnType := self visitType: aType resultType.
	fctCursor := aType declaration.
	arguments := aType argumentTypes
		withIndexCollect: [ :argT :idx | 
			| arg argName |
			arg := self visitType: argT.
			argName := (fctCursor argumentAt: idx) spelling.
			argName isEmpty
				ifTrue: [ argName := 'arg' , idx printString ].
			builder argumentNamed: argName type: arg sourceLocation: (self typeLocation: argT) ].
	^ builder arguments: arguments returnType: returnType sourceLocation: (self typeLocation: aType)
]

{ #category : #accessing }
CLHeaderParser >> functionFilter [
	^ functionFilter ifNil: [ functionFilter := self defaultFilterBlock ] ifNotNil: [ functionFilter ]
]

{ #category : #accessing }
CLHeaderParser >> functionFilter: aBlock [
	aBlock ifNil: [ ^ self ].
	functionFilter := aBlock
]

{ #category : #'private api' }
CLHeaderParser >> functionFromCursor: aFunctionCursor [
	| fctName fct |
	fctName := aFunctionCursor spelling.
	fct := builder
		functionNamed: fctName
		signature: (self visitType: aFunctionCursor type)
		sourceLocation: aFunctionCursor location presumedLocation.
	fct signature function: fct.
	fct signature arguments
		withIndexDo: [ :arg :idx | arg declarationName: (aFunctionCursor argumentAt: idx - 1) spelling ].
	functions
		at: fctName
		ifPresent: [ :value | value add: fct ]
		ifAbsent: [ functions at: fctName put: (OrderedCollection with: fct) ].
	^ fct
]

{ #category : #accessing }
CLHeaderParser >> functions [
	^ functions
]

{ #category : #'private api' }
CLHeaderParser >> functionsVisitor [
	^ self cursorVisitorClass
		on: [ :cursor :parent :clientData | 
			(cursor isFunctionDecl and: [ self isLinkable: cursor ])
				ifTrue: [ 
					(self functionFilter value: self headerFile value: cursor)
						ifTrue: [ self functionFromCursor: cursor ] ].
			self childVisitContinue ]
]

{ #category : #accessing }
CLHeaderParser >> headerFile [
	^ headerFile
]

{ #category : #accessing }
CLHeaderParser >> headerFile: anObject [
	headerFile := anObject
]

{ #category : #accessing }
CLHeaderParser >> headerFileName [
	^ ($# split: self headerFile asFileName) last
]

{ #category : #'accessing-libclang' }
CLHeaderParser >> indexClass [
	^ CLIndex 
]

{ #category : #'initialize-release' }
CLHeaderParser >> initialize [
	super initialize.
	compilationOptions := OrderedCollection new.
	"by default generate only the functions from the specified headerFile"
	singleFile := true.
	functions := Dictionary new.
	types := Dictionary new.
	unmappable := Set new.

	
]

{ #category : #testing }
CLHeaderParser >> isLinkable: aCursor [
	| linkageType |
	linkageType := aCursor linkage.
	^ linkageType = CXLinkageKindEnum CXLinkage_UniqueExternal 
		or: [ linkageType = CXLinkageKindEnum CXLinkage_External ]
]

{ #category : #'private api' }
CLHeaderParser >> kindToPrimaryType: aTypeKindItem [
	^ self builder
		primaryNamed: (aTypeKindItem copyFrom: 8 to: aTypeKindItem size) asSymbol asLowercase
		using: CLPrimaryBinding
]

{ #category : #api }
CLHeaderParser >> parseHeader [
	^ self convertHeader
]

{ #category : #'private type builders' }
CLHeaderParser >> pointer: aType [
	^ builder pointerTo: (self visitType: aType pointeeType) sourceLocation: (self typeLocation: aType)
]

{ #category : #'private type builders' }
CLHeaderParser >> record: aType [
	| recordDecl |
	recordDecl := types at: aType canonical put: (self recordFrom: aType).
	aType declaration visitChildren: (self recordVisitorCallback: recordDecl).
	^ recordDecl
]

{ #category : #'private type builders' }
CLHeaderParser >> recordFrom: aType [
	| cursor |
	cursor := aType declaration.
	cursor isStructDecl
		ifTrue: [ ^ builder structNamed: (self typeName: aType) sourceLocation: (self typeLocation: aType) ].
	cursor isUnionDecl
		ifTrue: [ ^ builder unionNamed: (self typeName: aType) sourceLocation: (self typeLocation: aType) ]
]

{ #category : #'private type builders' }
CLHeaderParser >> recordVisitorCallback: aRecord [
	^ self cursorVisitorClass
		on: [ :cursor :parent :data | 
			| fieldType fieldName crs |
			crs := cursor.
			cursor isTypeRef
				ifTrue: [ crs := cursor referenced ].
			fieldName := crs spelling.
			fieldName ifNotEmpty: [ 
					fieldType := self visitType: crs type.
					builder addField: fieldType -> fieldName toRecord: aRecord ].
			self childVisitContinue ]
]

{ #category : #api }
CLHeaderParser >> singleFile [
	singleFile := true.
]

{ #category : #accessing }
CLHeaderParser >> tu: aTranslationUnit [

	tu := aTranslationUnit 
]

{ #category : #'private api' }
CLHeaderParser >> typeLocation: aType [
	^aType declaration location presumedLocation 
]

{ #category : #'private api' }
CLHeaderParser >> typeName: aType [
	| tname |
	tname := aType declaration spelling.
	tname ifEmpty: [ ^ ($@ split: aType declaration usr) last ].
	"tname size > 0 ifFalse:[^nil]."
	^ tname
]

{ #category : #'private type builders' }
CLHeaderParser >> typedef: aType [
	^ builder
		aliasNamed: (self typeName: aType)
		of: (self visitType: aType canonical)
		sourceLocation: (self typeLocation: aType)
]

{ #category : #accessing }
CLHeaderParser >> types [
	"do not return the keys in the types dictionary since the translationUnit was garbage collected after generateFFI call"
	^ types values asSet 
]

{ #category : #'private type builders' }
CLHeaderParser >> unexposed: aType [
	^self visitType: aType canonical.
]

{ #category : #accessing }
CLHeaderParser >> unmappable [
	^ unmappable
]

{ #category : #accessing }
CLHeaderParser >> unmappable: anObject [
	unmappable := anObject
]

{ #category : #'private api' }
CLHeaderParser >> unsupported: aType [
	^ types
		at: aType canonical
		put:
			(unmappable
				add:
					(builder
						unsupportedNamed: (self typeName: aType)
						type: aType kind -> aType declaration kind
						sourceLocation: (self typeLocation: aType)))
]

{ #category : #'private api' }
CLHeaderParser >> visitType: aType [
	| type typeProcessor |
	(type := self kindToPrimaryType: aType kind item) ifNotNil: [ ^ type ].
	types at: aType ifPresent: [ :v | ^ v ].
	typeProcessor := self class clangTypeToProcessorSymbol 
		at: aType kind item 
		ifAbsent: [ ^ self unsupported: aType ].
	^ types at: aType put: (self perform: typeProcessor withArguments: {aType})
]
