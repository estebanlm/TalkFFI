"
CLPrimary represents a primary type like int, long, double, etc
"
Class {
	#name : #CLPrimary,
	#superclass : #CLType,
	#classVars : [
		'Instances'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLPrimary >> accept: aVisitor [ 
		^aVisitor visitCLPrimary: self
]

{ #category : #testing }
CLPrimary >> isCLPrimary [
	^true
]
