Class {
	#name : #CLHeaderDeclarations,
	#superclass : #CLNode,
	#instVars : [
		'types',
		'functions',
		'unmappable'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLHeaderDeclarations >> accept: aVisitor [ 
		^aVisitor visitCLHeaderDeclarations: self
]

{ #category : #accessing }
CLHeaderDeclarations >> functionDeclarations [
	" ignore overloaded functions"

	^ functions values collect: [ :each | each first ]
]

{ #category : #accessing }
CLHeaderDeclarations >> functions [
	^ functions
]

{ #category : #accessing }
CLHeaderDeclarations >> functions: anObject [
	functions := anObject
]

{ #category : #testing }
CLHeaderDeclarations >> isCLHeaderDeclarations [
	^true
]

{ #category : #accessing }
CLHeaderDeclarations >> types [
	^ types
]

{ #category : #accessing }
CLHeaderDeclarations >> types: anObject [
	types := anObject
]

{ #category : #accessing }
CLHeaderDeclarations >> unmappable [
	^ unmappable
]

{ #category : #accessing }
CLHeaderDeclarations >> unmappable: anObject [
	unmappable := anObject
]
