Class {
	#name : #CLFunctionDeclaration,
	#superclass : #CLNode,
	#instVars : [
		'signature',
		'callingConvention'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLFunctionDeclaration >> accept: aVisitor [ 
		^aVisitor visitCLFunctionDeclaration: self
]

{ #category : #accessing }
CLFunctionDeclaration >> arguments [
	^signature arguments 
]

{ #category : #accessing }
CLFunctionDeclaration >> arguments: anObject [
	signature arguments: anObject
]

{ #category : #accessing }
CLFunctionDeclaration >> callingConvention [
	^ callingConvention
]

{ #category : #accessing }
CLFunctionDeclaration >> callingConvention: anObject [
	callingConvention := anObject
]

{ #category : #testing }
CLFunctionDeclaration >> isCLFunctionDeclaration [
	^true
]

{ #category : #printing }
CLFunctionDeclaration >> printOn: aStream [
	self returnType printOn: aStream.
	aStream
		nextPut: $ ;
		nextPutAll: self declarationName;
		nextPut: $(.
	self arguments do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)
]

{ #category : #accessing }
CLFunctionDeclaration >> returnType [
	^signature returnType
]

{ #category : #accessing }
CLFunctionDeclaration >> returnType: anObject [
	signature returnType: anObject
]

{ #category : #accessing }
CLFunctionDeclaration >> signature [
	^ signature
]

{ #category : #accessing }
CLFunctionDeclaration >> signature: anObject [
	signature := anObject
]
