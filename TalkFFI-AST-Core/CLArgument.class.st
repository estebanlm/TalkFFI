Class {
	#name : #CLArgument,
	#superclass : #CLNode,
	#instVars : [
		'type'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLArgument >> accept: aVisitor [
	^ aVisitor visitCLArgument: self
]

{ #category : #testing }
CLArgument >> isCLArgument [
	^true
]

{ #category : #printing }
CLArgument >> printOn: aStream [
	aStream
		nextPutAll: self type printString;
		nextPutAll: ' ';
		nextPutAll: self declarationName asString
]

{ #category : #accessing }
CLArgument >> type [
	^ type
]

{ #category : #accessing }
CLArgument >> type: anObject [
	type := anObject
]
