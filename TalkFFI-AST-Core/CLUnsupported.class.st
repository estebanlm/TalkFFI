Class {
	#name : #CLUnsupported,
	#superclass : #CLType,
	#instVars : [
		'type'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLUnsupported >> accept: aVisitor [ 
		^aVisitor visitCLUnsupported: self
]

{ #category : #printing }
CLUnsupported >> clPrintOn: aStream [
	super clPrintOn: aStream.
	aStream nextPutAll: type printString
]

{ #category : #initialization }
CLUnsupported >> initialize [
	super initialize
]

{ #category : #testing }
CLUnsupported >> isCLUnsupported [
	^true
]

{ #category : #accessing }
CLUnsupported >> type [
	^ type
]

{ #category : #accessing }
CLUnsupported >> type: anObject [
	type := anObject
]
