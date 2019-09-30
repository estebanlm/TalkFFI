Class {
	#name : #CLStructure,
	#superclass : #CLOpaque,
	#instVars : [
		'fields'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLStructure >> accept: aVisitor [ 
		^aVisitor visitCLStructure: self
]

{ #category : #accessing }
CLStructure >> add: aField [
	self fields add: aField
]

{ #category : #accessing }
CLStructure >> fields [
	^ fields
]

{ #category : #accessing }
CLStructure >> fields: anObject [
	fields := anObject
]

{ #category : #'initialize-release' }
CLStructure >> initialize [ 	
	super initialize .
	fields := OrderedCollection new.
]

{ #category : #testing }
CLStructure >> isCLStructure [
	^true
]
