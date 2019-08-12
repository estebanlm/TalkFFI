Class {
	#name : #CLPointer,
	#superclass : #CLType,
	#instVars : [
		'pointee'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLPointer >> accept: aVisitor [ 
		^aVisitor visitCLPointer: self
]

{ #category : #testing }
CLPointer >> isCLPointer [
	^true
]

{ #category : #accessing }
CLPointer >> pointee [
	^ pointee
]

{ #category : #accessing }
CLPointer >> pointee: anObject [
	pointee := anObject
]

{ #category : #printing }
CLPointer >> printOn: aStream [
	aStream nextPut: $[.
	pointee printOn: aStream.
	aStream nextPut: $*.
	aStream nextPut: $]
]
