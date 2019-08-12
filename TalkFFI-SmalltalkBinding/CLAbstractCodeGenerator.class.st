Class {
	#name : #CLAbstractCodeGenerator,
	#superclass : #CLNodeVisitor,
	#instVars : [
		'mayGC',
		'mappingModel'
	],
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #'accessing mapping' }
CLAbstractCodeGenerator >> arraySuperclass [ 
	^self subclassResponsibility 
]

{ #category : #'accessing mapping' }
CLAbstractCodeGenerator >> callbackSuperclass [ 
	^self subclassResponsibility 
]

{ #category : #accessing }
CLAbstractCodeGenerator >> classNamed: aName [
	^self rbModel classNamed: aName 
]

{ #category : #'compiling methods' }
CLAbstractCodeGenerator >> compile: aMethodString in: aClass classified: category [
	self rbModel compile: aMethodString in: aClass classified: category
]

{ #category : #'compiling methods' }
CLAbstractCodeGenerator >> compileEnumSpec: items in: aClass [
	self 
		compile: (self enumSpecString: items) 
		in: aClass 
		classified: 'enum declaration'
]

{ #category : #'compiling methods' }
CLAbstractCodeGenerator >> compileFnCall: aName signature: aSignature in: aClass [
	self
		compile: (self fnMethodString: { aSignature first. aName. aSignature last })
		in: aClass
		classified: 'foreign interface'
]

{ #category : #'compiling methods' }
CLAbstractCodeGenerator >> compileFnSpec: aSignature in: aClass [
	self 
		compile: (self fnSpecString: aSignature) 
		in: aClass 
		classified: 'accessing'
]

{ #category : #'compiling methods' }
CLAbstractCodeGenerator >> compileStructSpec: fields in: aClass [
	self 
		compile: (self structSpecString: fields) 
		in: aClass 
		classified: 'accessing'
]

{ #category : #'compiling methods' }
CLAbstractCodeGenerator >> compileUnionSpec: fields in: aClass [
	"union and structs have similar spec strings only semantics change"
	self 
		compile: (self unionSpecString: fields) 
		in: aClass 
		classified: 'accessing'
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineArrayClass: aName [
	self 
		defineClass: aName 
		superclass: self arraySuperclass 
		in: self mappingModel typesCategory
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineCallbackClass: aName [
	self 
		defineClass: aName 
		superclass: self callbackSuperclass 
		in: self mappingModel typesCategory
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineCallbackClass: aName superclass: aSuperclassName [
	self 
		defineClass: aName 
		superclass: aSuperclassName 
		in: self mappingModel typesCategory
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineClass: aClassName superclass: aSuperclassName in: aCategory [
	^self rbModel defineClass: ('<1s> subclass: #<2s>
		instanceVariableNames: ''''
		classVariableNames: ''''
		poolDictionaries: ''''
		category: #<3p>' 
			expandMacrosWith: aSuperclassName 
			with: aClassName 
			with: aCategory)
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineEnumClass: aName [
	self 
		defineClass: aName 
		superclass: self enumSuperclass 
		in: self mappingModel typesCategory
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineHClass: aName [
	self 
		defineClass: aName 
		superclass: self headerSuperclass 
		in: self mappingModel bindingCategory
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineOpaqueClass: aName [
	self 
		defineClass: aName 
		superclass: self opaqueSuperclass 
		in: self mappingModel typesCategory
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineStructClass: aName [
	self 
		defineClass: aName 
		superclass: self structSuperclass 
		in: self mappingModel typesCategory
]

{ #category : #'compiling classes' }
CLAbstractCodeGenerator >> defineUnionClass: aName [
	self 
		defineClass: aName 
		superclass: self unionSuperclass 
		in: self mappingModel typesCategory
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> enumSpecString: items [
	|  rStream wStream |
	rStream := (items associations asSortedCollection: [ :a :b | a value < b value ]) readStream.
	wStream := String new writeStream cr.
	[ rStream atEnd ]
		whileFalse: [ 
			| item |
			item := rStream next.
			wStream
				tab;
				nextPutAll: item key asString;
				space;
				nextPutAll: item value printString;
				cr ].
	^ 'enumDecl<n><t>^#(<1s>)' expandMacrosWith: wStream contents
]

{ #category : #'accessing mapping' }
CLAbstractCodeGenerator >> enumSuperclass [ 
	^self subclassResponsibility 
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> fieldsString: fields [
	| rStream wStream |
	wStream := String new writeStream cr.
	rStream := fields readStream.
	[ rStream atEnd ]
		whileFalse: [ 
			| field |
			field := rStream next.
			wStream
				tab;
				nextPutAll: field key;
				space;
				nextPutAll: field value;
				nextPut: $;;
				cr ].
	^ wStream contents
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> fnMethodString: aNamedSignature [
	| methodTemplate |
	
	methodTemplate := '<1s><n><t>^self ffiCall: <2s>'
		expandMacrosWithArguments:
			{(self selectorString: aNamedSignature).
			(self fnSignatureString: aNamedSignature) }.

	^ methodTemplate, ((mayGC at: aNamedSignature second) 
		ifTrue: [ ' options: #( optMayGC )' ] 
		ifFalse: [ '' ])
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> fnSignatureString: aSignature [
	| wStream rStream idx |
	wStream := String new writeStream.
	wStream
		nextPutAll: aSignature first asString;
		space.
	aSignature size = 3
		ifTrue: [ wStream nextPutAll: aSignature second ].
	wStream nextPut: $(.
	rStream := aSignature last readStream.
	idx := 1.
	[ rStream atEnd ]
		whileFalse: [ 
			| arg |
			arg := rStream next.
			(arg isKindOf: Association)
				ifTrue: [ 
					wStream
						nextPutAll: arg key asString;
						space;
						nextPutAll:
								(arg value isEmpty
										ifTrue: [ 'arg' , idx printString ]
										ifFalse: [ arg value uncapitalized ]) ]
				ifFalse: [ wStream nextPutAll: 'self' ].
			rStream peek
				ifNotNil: [ 
					wStream
						nextPut: $,;
						space ].
			idx := idx + 1 ].
	wStream nextPut: $).
	^ '#(<1s>)' expandMacrosWith: wStream contents
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> fnSpecString: aSignature [
	^ 'fnSpec<n><t>^<1s>' expandMacrosWith: (self fnSignatureString: aSignature)
]

{ #category : #'accessing mapping' }
CLAbstractCodeGenerator >> headerSuperclass [ 
	^self subclassResponsibility 
]

{ #category : #initialization }
CLAbstractCodeGenerator >> initialize [ 
	super initialize .
	mayGC := Dictionary new.
]

{ #category : #accessing }
CLAbstractCodeGenerator >> mappingModel [
	^ mappingModel isNil
		ifTrue: [ mappingModel := CLMappingModel new ]
		ifFalse: [ mappingModel ]
]

{ #category : #accessing }
CLAbstractCodeGenerator >> mappingModel: aMappingModel [
	mappingModel := aMappingModel
]

{ #category : #accessing }
CLAbstractCodeGenerator >> metaclassNamed: aName [
	^self rbModel metaclassNamed: aName 
]

{ #category : #'accessing mapping' }
CLAbstractCodeGenerator >> opaqueSuperclass [ 
	^self subclassResponsibility 
]

{ #category : #accessing }
CLAbstractCodeGenerator >> rbModel [
	^self subclassResponsibility 
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> selectorString: aNamedSignature [
	| idx rStream wStream wasSelf |
	wStream := String new writeStream.
	rStream := aNamedSignature last readStream.
	wStream nextPutAll: aNamedSignature second.
	idx := 1.
	wasSelf := false.
	[ rStream atEnd ]
		whileFalse: [ 
			| arg argName |
			arg := rStream next.
			(arg isKindOf: Association)
				ifTrue: [ 
					argName := arg value.
					argName isEmpty
						ifTrue: [ argName := 'arg' , idx printString ].
					(idx = 1 or: [ wasSelf ])
						ifFalse: [ wStream nextPutAll: argName ].
					wStream
						nextPut: $:;
						space;
						nextPutAll: argName uncapitalized;
						space.
					wasSelf := false ]
				ifFalse: [ wasSelf := true ].
			idx := idx + 1 ].
	^ wStream contents
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> structSpecString: fields [
	^ 'fieldsDesc<n><t>^#(<1s><n><t>)' expandMacrosWith: (self fieldsString: fields)
]

{ #category : #'accessing mapping' }
CLAbstractCodeGenerator >> structSuperclass [ 
	^self subclassResponsibility 
]

{ #category : #'string generation' }
CLAbstractCodeGenerator >> unionSpecString: fields [
	^ 'fieldsDesc<n><t>^#(<1s><n><t>)' expandMacrosWith: (self fieldsString: fields)
]

{ #category : #'accessing mapping' }
CLAbstractCodeGenerator >> unionSuperclass [ 
	^self subclassResponsibility 
]
