Class {
	#name : #CLType,
	#superclass : #CLNode,
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLType >> accept: aVisitor [ 
		^aVisitor visitCLType: self
]

{ #category : #testing }
CLType >> isCLType [
	^true
]
