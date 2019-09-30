Class {
	#name : #CLEnumeration,
	#superclass : #CLType,
	#instVars : [
		'items',
		'type'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLEnumeration >> accept: aVisitor [ 
		^aVisitor visitCLEnumeration: self
]

{ #category : #accessing }
CLEnumeration >> at: item put: value [
	^items at: item put: value.
]

{ #category : #'initialize-release' }
CLEnumeration >> initialize [ 
	super initialize .
	items := Dictionary new.
]

{ #category : #testing }
CLEnumeration >> isCLEnumeration [
	^true
]

{ #category : #accessing }
CLEnumeration >> items [
	^ items
]

{ #category : #accessing }
CLEnumeration >> items: anObject [
	items := anObject
]

{ #category : #accessing }
CLEnumeration >> type [
	^ type
]

{ #category : #accessing }
CLEnumeration >> type: anObject [
	type := anObject
]
