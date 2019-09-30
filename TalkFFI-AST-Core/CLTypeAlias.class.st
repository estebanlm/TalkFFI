Class {
	#name : #CLTypeAlias,
	#superclass : #CLType,
	#instVars : [
		'canonicalType'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLTypeAlias >> accept: aVisitor [ 
		^aVisitor visitCLTypeAlias: self
]

{ #category : #accessing }
CLTypeAlias >> canonicalType [
	^ canonicalType
]

{ #category : #accessing }
CLTypeAlias >> canonicalType: anObject [
	canonicalType := anObject
]

{ #category : #testing }
CLTypeAlias >> isCLTypeAlias [
	^true
]

{ #category : #printing }
CLTypeAlias >> printOn: aStream [
	aStream nextPut: $[.
	declarationName printOn: aStream.
	aStream nextPutAll: '-->'.
	canonicalType printOn: aStream.
	aStream nextPut: $]
]
