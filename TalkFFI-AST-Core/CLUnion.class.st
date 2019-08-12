Class {
	#name : #CLUnion,
	#superclass : #CLStructure,
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLUnion >> accept: aVisitor [ 
		^aVisitor visitCLUnion: self
]

{ #category : #testing }
CLUnion >> isCLUnion [
	^true
]
