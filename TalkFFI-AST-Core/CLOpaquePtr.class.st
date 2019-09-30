Class {
	#name : #CLOpaquePtr,
	#superclass : #CLOpaque,
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLOpaquePtr >> accept: aVisitor [ 
		^aVisitor visitCLOpaquePtr: self
]

{ #category : #testing }
CLOpaquePtr >> isCLOpaquePtr [
	^true
]
