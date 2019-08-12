Class {
	#name : #CLField,
	#superclass : #CLArgument,
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLField >> accept: aVisitor [ 
		^aVisitor visitCLField: self
]

{ #category : #testing }
CLField >> isCLField [
	^true
]
