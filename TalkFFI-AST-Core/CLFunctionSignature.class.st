Class {
	#name : #CLFunctionSignature,
	#superclass : #CLType,
	#instVars : [
		'returnType',
		'arguments',
		'function'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLFunctionSignature >> accept: aVisitor [ 
		^aVisitor visitCLFunctionSignature: self
]

{ #category : #accessing }
CLFunctionSignature >> arguments [
	^ arguments
]

{ #category : #accessing }
CLFunctionSignature >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
CLFunctionSignature >> function [
	^ function
]

{ #category : #accessing }
CLFunctionSignature >> function: anObject [
	function := anObject
]

{ #category : #'initialize-release' }
CLFunctionSignature >> initialize [ 
	super initialize.
	arguments := OrderedCollection new.
]

{ #category : #testing }
CLFunctionSignature >> isCLFunctionSignature [
	^true
]

{ #category : #printing }
CLFunctionSignature >> printOn: aStream [
	aStream
		nextPut: $[;
		nextPut: $(.
	arguments do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream
		nextPut: $);
		nextPutAll: ' -> ';
		nextPutAll: returnType printString;
		nextPut: $]
]

{ #category : #accessing }
CLFunctionSignature >> returnType [
	^ returnType
]

{ #category : #accessing }
CLFunctionSignature >> returnType: anObject [
	returnType := anObject
]
