Class {
	#name : #CLOpaque,
	#superclass : #CLType,
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLOpaque >> accept: aVisitor [ 
		^aVisitor visitCLOpaque: self
]

{ #category : #testing }
CLOpaque >> isCLOpaque [
	^true
]
