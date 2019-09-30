Class {
	#name : #CLNameGeneration,
	#superclass : #CLNodeTraversal,
	#instVars : [
		'defaultName',
		'prefix',
		'uniqueIdx'
	],
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #'instance creation' }
CLNameGeneration class >> defaultName: aName prefix: aPrefix [
	^ self new
		initialize;
		defaultName: aName;
		prefix: aPrefix
]

{ #category : #actions }
CLNameGeneration >> arrayExit: aNode [
	self node: aNode suffix: 'A'.
]

{ #category : #private }
CLNameGeneration >> camelFromString: aString [
	| prevIsLetter newString |
	prevIsLetter := false.
	newString := aString
		inject: String new
		into: [ :str :ch | 
			| nCh |
			nCh := ch.
			ch isLetter
				ifTrue: [ 
					prevIsLetter
						ifFalse: [ nCh := ch asUppercase ].
					prevIsLetter := true ]
				ifFalse: [ prevIsLetter := false ].
			nCh isAlphaNumeric
				ifTrue: [ str , nCh asString ]
				ifFalse: [ str ] ].
	(newString isEmpty or: [ newString first isLetter not ])
		ifTrue: [ newString := 'V' , newString ].
	^ newString
]

{ #category : #accessing }
CLNameGeneration >> defaultName [
	^ defaultName
]

{ #category : #accessing }
CLNameGeneration >> defaultName: anObject [
	defaultName := self camelFromString: anObject.
	defaultName at: defaultName size put: defaultName last asUppercase
]

{ #category : #actions }
CLNameGeneration >> enumerationExit: aNode [
	self node: aNode suffix: 'E'
]

{ #category : #actions }
CLNameGeneration >> functionSignatureExit: aNode [
	aNode function ifNil: [ self node: aNode suffix: 'Cb' ]
]

{ #category : #actions }
CLNameGeneration >> headerDeclarationsExit: aNode [
	| name |
	name := self prefix , (self camelFromString: aNode declarationName).
	name at: name size put: name last asUppercase.
	aNode declarationName: name asSymbol
]

{ #category : #'initialize-release' }
CLNameGeneration >> initialize [
	super initialize.
	defaultName := 'Unamed'.
	prefix := ''.
	uniqueIdx := 0.
	doFunctions := false.
]

{ #category : #private }
CLNameGeneration >> name: aName prefix: aPrefix suffix: aSuffix [
	| name |
	name := (aName isNil or: [ aName = '' ])
		ifTrue: [ defaultName, self uniqueIdx printString ]
		ifFalse: [ self camelFromString: (aName asString copyReplaceAll: '*' with: 'Ptr') ].
	name := (name beginsWith: aPrefix)
		ifTrue: [ name ]
		ifFalse: [ aPrefix, name ].
	^ (name , aSuffix) asSymbol
]

{ #category : #private }
CLNameGeneration >> node: aNode suffix: aString [
	aNode declarationName: (self name: aNode declarationName prefix: self prefix suffix: aString)
]

{ #category : #actions }
CLNameGeneration >> opaquePtrExit: aNode [
	self node: aNode suffix: 'O'
]

{ #category : #accessing }
CLNameGeneration >> prefix [
	^ prefix
]

{ #category : #accessing }
CLNameGeneration >> prefix: anObject [
	prefix := anObject
]

{ #category : #actions }
CLNameGeneration >> structureExit: aNode [
	self node: aNode suffix: 'S'
]

{ #category : #actions }
CLNameGeneration >> typeAliasExit: aNode [
	(aNode canonicalType isCLPointer and: [ aNode canonicalType pointee isCLFunctionSignature ])
		ifTrue: [ self node: aNode suffix: '' ]
]

{ #category : #actions }
CLNameGeneration >> unionExit: aNode [
	self node: aNode suffix: 'U'
]

{ #category : #accessing }
CLNameGeneration >> uniqueIdx [
	^uniqueIdx := uniqueIdx + 1.
]
