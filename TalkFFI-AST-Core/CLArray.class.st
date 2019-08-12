Class {
	#name : #CLArray,
	#superclass : #CLType,
	#instVars : [
		'elementType',
		'numElements'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLArray >> accept: aVisitor [ 
		^aVisitor visitCLArray: self
]

{ #category : #printing }
CLArray >> clPrintOn: aStream [
	self numElements printOn: aStream 
]

{ #category : #accessing }
CLArray >> elementType [
	^ elementType
]

{ #category : #accessing }
CLArray >> elementType: anObject [
	elementType := anObject
]

{ #category : #testing }
CLArray >> isCLArray [
	^true
]

{ #category : #accessing }
CLArray >> numElements [
	^ numElements
]

{ #category : #accessing }
CLArray >> numElements: anObject [
	numElements := anObject
]
