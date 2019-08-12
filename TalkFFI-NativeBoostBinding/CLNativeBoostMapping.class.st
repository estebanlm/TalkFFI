Class {
	#name : #CLNativeBoostMapping,
	#superclass : #CLAbstractCodeGenerator,
	#instVars : [
		'headerClass',
		'opaque',
		'idx'
	],
	#classVars : [
		'Primaries2NBTypes'
	],
	#category : 'TalkFFI-NativeBoostBinding'
}

{ #category : #'class initialization' }
CLNativeBoostMapping class >> initialize [
	self initializePrimariesToNBTypes
]

{ #category : #initialization }
CLNativeBoostMapping class >> initializePrimariesToNBTypes [
	Primaries2NBTypes := {
	(#bool -> #bool).
	(#char16 -> #int16).
	(#char32 -> #int32).
	(#char_s -> #char).
	(#char_u -> #uint8).
	(#double -> #double).
	(#firstbuiltin -> #void).
	(#float -> #float).
	(#int -> #int).
	(#int128 -> FFIExternalType).
	(#long -> #long).
	(#longdouble -> #FFIInt64).
	(#longlong -> #int64).
	(#schar -> #int8).
	(#short -> #int8).
	(#uchar -> #uint8).
	(#uint -> #uint).
	(#uint128 -> FFIExternalType).
	(#ulong -> #ulong).
	(#ulonglong -> #uint64).
	(#ushort -> #uint8).
	(#void -> #void).
	(#wchar -> FFICharacterType)} asDictionary
]

{ #category : #accessing }
CLNativeBoostMapping class >> primariesToNbTypes [
	^ Primaries2NBTypes
]

{ #category : #'accessing mapping' }
CLNativeBoostMapping >> callbackSuperclass [ 
	^ #CLFFICallback
]

{ #category : #testing }
CLNativeBoostMapping >> checkAvailability: aFctName [
	self mappingModel libraryPath ifNil: [ ^ self ].
	[ ExternalAddress loadSymbol: aFctName module: self mappingModel libraryPath ] 
	on: PrimitiveFailed do: [ :e | 
			Transcript
				show: 'Missing ' , aFctName , ' ' , self mappingModel libraryPath asPath basename;
				cr ]
]

{ #category : #'compiling methods' }
CLNativeBoostMapping >> compileFFILibraryName: aClassName [
	self
		compile:
			('ffiLibraryName<n><t>^ <1s>' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'library path'.
			
	self
		compile:
			('ffiLibraryName<n><t>^ self class ffiLibraryName' expandMacrosWith: self mappingModel typemapClassName)
		in: (self classNamed: aClassName)
		classified: 'library path'
]

{ #category : #'compiling methods' }
CLNativeBoostMapping >> compileNbBindingOf: aClassName [
	self
		compile: ('ffiBindingOf: aTypeName<n><t>^ <1s><n><t><t>typeAt: aTypeName<n><t><t>ifAbsent: [ super ffiBindingOf: aTypeName ]' 
			expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'ffi types'
]

{ #category : #'compiling classes' }
CLNativeBoostMapping >> defineCallbackClass: aName [
	| name |
	name := aName.
	name ifNil: [ name := (headerClass , 'CbAnon' , (idx := idx + 1) printString) asSymbol ].
	super defineCallbackClass: name.
	self compileNbBindingOf: name.
	^ self generatedClasses callbackClasses add: name
]

{ #category : #'compiling classes' }
CLNativeBoostMapping >> defineEnumClass: aName [
	super defineEnumClass: aName.
	^ self generatedClasses enumClasses add: aName
]

{ #category : #'compiling classes' }
CLNativeBoostMapping >> defineHClass: aName [
	super defineHClass: aName.
	self compileNbBindingOf: aName.
	self compileFFILibraryName: aName.
	^ self generatedClasses headerClasses add: aName
]

{ #category : #'compiling classes' }
CLNativeBoostMapping >> defineOpaqueClass: aName [
	super defineOpaqueClass: aName.
	self compileNbBindingOf: aName.
	^ self generatedClasses opaqueClasses add: aName
]

{ #category : #'compiling classes' }
CLNativeBoostMapping >> defineStructClass: aName [
	super defineStructClass: aName.
	self compileNbBindingOf: aName.
	^ self generatedClasses structClasses add: aName
]

{ #category : #'compiling classes' }
CLNativeBoostMapping >> defineUnionClass: aName [
	super defineUnionClass: aName.
	self compileNbBindingOf: aName.
	^ self generatedClasses unionClasses add: aName
]

{ #category : #'accessing mapping' }
CLNativeBoostMapping >> enumSuperclass [ 
	^ #FFIExternalEnumeration
]

{ #category : #accessing }
CLNativeBoostMapping >> ffiSelectorBlock [
	^ self mappingModel ffiSelectorBlock
]

{ #category : #accessing }
CLNativeBoostMapping >> ffiSelectorBlock: anObject [
	self mappingModel ffiSelectorBlock: anObject
]

{ #category : #accessing }
CLNativeBoostMapping >> generatedClasses [
	^ self mappingModel generatedClasses
]

{ #category : #'accessing mapping' }
CLNativeBoostMapping >> headerSuperclass [ 
	^ #CLHeader
]

{ #category : #initialization }
CLNativeBoostMapping >> initialize [ 
	super initialize .
	idx := 0.
]

{ #category : #testing }
CLNativeBoostMapping >> isMapped: aNode [
	^self mapping at: aNode ifAbsent: [ nil ]
]

{ #category : #accessing }
CLNativeBoostMapping >> mapping [
	^ self mappingModel mapping
]

{ #category : #accessing }
CLNativeBoostMapping >> opaque [
	^ opaque isNil
		ifTrue: [ opaque := (CLPrimary named: #void) accept: self ]
		ifFalse: [ opaque ]
]

{ #category : #'accessing mapping' }
CLNativeBoostMapping >> opaqueSuperclass [
	^ #FFIOpaqueObject
]

{ #category : #changes }
CLNativeBoostMapping >> openChanges [
	self rbModel changes open.
]

{ #category : #accessing }
CLNativeBoostMapping >> prefix [
	^ self mappingModel classPrefix 
]

{ #category : #accessing }
CLNativeBoostMapping >> prefix: anObject [
	self mappingModel classPrefix:  anObject
]

{ #category : #accessing }
CLNativeBoostMapping >> rbModel [
	^ self mappingModel model 
]

{ #category : #private }
CLNativeBoostMapping >> resolveType: pointeeType [
	^ [ FFIExternalType resolveType: pointeeType ] 
		ifError: [ nil ]
	
]

{ #category : #'string generation' }
CLNativeBoostMapping >> selectorString: aNamedSignature [
	^ self ffiSelectorBlock value: (super selectorString: aNamedSignature)
]

{ #category : #'accessing mapping' }
CLNativeBoostMapping >> structSuperclass [ 
	^ #FFIExternalStructure
]

{ #category : #accessing }
CLNativeBoostMapping >> typemap [
	^ self mappingModel typemap
]

{ #category : #accessing }
CLNativeBoostMapping >> typemap: anObject [
	self mappingModel typemap:  anObject
]

{ #category : #'accessing mapping' }
CLNativeBoostMapping >> unionSuperclass [ 
	^ #FFIExternalUnion
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLArgument: aNode [
	| node type |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	type := aNode type accept: self.
	^ self mapping at: aNode put: type -> aNode declarationName
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLArray: aNode [
	| node elementType arName |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	elementType := aNode elementType accept: self.
	arName := self defineArrayClass: elementType.
	self
		compile: ('arrayDecl <n><t>^#(<1s> <2p>)' expandMacrosWith: elementType with: aNode numElements)
		in: (self metaclassNamed: arName)
		classified: 'array initialization'.
	(RBRenameClassRefactoring
		model: self rbModel
		rename: (self classNamed: arName)
		to: (arName := arName , aNode numElements printString)) transform.
	^ self mapping
		at: aNode
		put: (arName , '[' , (aNode numElements ifNil: [ '' ] ifNotNil: [ aNode numElements printString ]) , ']') asSymbol
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLEnumeration: aNode [
	| node  eName |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	eName := self defineEnumClass: aNode declarationName.
	self compileEnumSpec: aNode items in: (self metaclassNamed: eName).
	^ self mapping at: aNode put: eName
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLField: aNode [
	| node type  |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	type := aNode type accept: self.	
	^self  mapping at: aNode put: (type -> aNode declarationName)
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLFunctionDeclaration: aNode [
	| node signature  |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	self checkAvailability: aNode declarationName.
	signature := aNode signature accept: self.
	^ self compileFnCall: aNode declarationName signature: signature in: (self classNamed: headerClass)
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLFunctionSignature: aNode [
	| node returnType args |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	returnType := aNode returnType accept: self.
	args := aNode arguments collect: [ :each | each accept: self ].
	^ self mapping
		at: aNode
		put:
			{returnType.
			args}
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLHeaderDeclarations: aNode [
	|   node |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	headerClass := self defineHClass: aNode declarationName.
	mayGC := aNode accept: CLFunctionsThatMayGC new.
	 aNode types do: [ :each | each accept: self ].	
	"here we need to solve the case of multiple definitions of the same function"
	"do not consider overloads for now, just get the last definition"
	aNode functions values do: [ :each | each last accept: self ]
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLOpaquePtr: aNode [
	| node  eName |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	eName := self defineOpaqueClass: aNode declarationName.
	^ self mapping at: aNode put: eName
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLPointer: aNode [
	| node pointeeType |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	pointeeType := aNode pointee accept: self.
	aNode pointee isCLFunctionSignature
		ifTrue: [ 
			| cName |
			cName := self defineCallbackClass: aNode pointee declarationName.
			self compileFnSpec: pointeeType in: (self metaclassNamed: cName).
			^ self mapping at: aNode put: cName ].
	((self resolveType: pointeeType) isKindOf: FFICharacterType) 
		ifTrue:[ ^self mapping at: aNode put: #String ].
	pointeeType = #FFIExternalString 
		ifTrue:[ ^self mapping at: aNode put: #char, ' **'].
	^ self mapping at: aNode put: pointeeType , ' *'
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLPrimary: aNode [
	| node |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	^self  mapping 
		at: aNode 
		put: (self class primariesToNbTypes at: aNode declarationName) asString
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLStructure: aNode [
	| node fields sName  |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	node := self mapping at: aNode put: aNode declarationName.
	fields := aNode fields collect: [ :field | field accept: self ].
	fields isEmpty
		ifTrue: [ 
			"If the structure does not have any fields then it is used just in typedefs such as: typedef struct MyStruct *mytype_t;"
			^ self mapping at: aNode put: self opaque ].
	sName := self defineStructClass: node.
	self compileStructSpec: fields in: (self metaclassNamed: sName).
	^ node
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLTypeAlias: aNode [
	| node canonicalType |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	node := self mapping at: aNode put: aNode declarationName.
	canonicalType := aNode canonicalType accept: self.
	(aNode canonicalType isCLPointer and: [ aNode canonicalType pointee isCLFunctionSignature ])
		ifTrue: [ 
			self defineCallbackClass: aNode declarationName superclass: canonicalType.
			self mapping at: aNode canonicalType put: aNode declarationName ]
		ifFalse: [ 
			"here we alias the canonical type to the declaration name"
			self typemap at: node asString put: canonicalType asString ].
	^ node
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLUnion: aNode [
	| node fields uName  |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	node := self mapping at: aNode put: aNode declarationName.
	fields := aNode fields collect: [ :field | field accept: self ].
	fields isEmpty
		ifTrue: [ 
			"If the union does not have any fields then it is used just in typedefs such as: typedef union myunion *mytype_t;"
			^ self mapping at: aNode put: self opaque ].
	uName := self defineUnionClass: node.
	self compileUnionSpec: fields in: (self metaclassNamed: uName).
	^ node
]

{ #category : #visiting }
CLNativeBoostMapping >> visitCLUnsupported: aNode [
	| node |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	self mappingModel isIgnoringUnsupported 
		ifFalse: [ self notify: 'Unsupported definition ' , aNode printString , ' found' ].
	^ self mapping at: aNode put: '"unsupported"'
]
