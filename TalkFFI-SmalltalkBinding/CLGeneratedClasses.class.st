Class {
	#name : #CLGeneratedClasses,
	#superclass : #Object,
	#instVars : [
		'structClasses',
		'enumClasses',
		'callbackClasses',
		'unionClasses',
		'headerClasses',
		'arrayClasses',
		'opaqueClasses'
	],
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #accessing }
CLGeneratedClasses >> arrayClasses [
	^ arrayClasses
]

{ #category : #accessing }
CLGeneratedClasses >> arrayClasses: anObject [
	arrayClasses := anObject
]

{ #category : #accessing }
CLGeneratedClasses >> callbackClasses [
	^ callbackClasses
]

{ #category : #accessing }
CLGeneratedClasses >> callbackClasses: anObject [
	callbackClasses := anObject
]

{ #category : #accessing }
CLGeneratedClasses >> enumClasses [
	^ enumClasses
]

{ #category : #accessing }
CLGeneratedClasses >> enumClasses: anObject [
	enumClasses := anObject
]

{ #category : #accessing }
CLGeneratedClasses >> headerClasses [
	^ headerClasses
]

{ #category : #accessing }
CLGeneratedClasses >> headerClasses: anObject [
	headerClasses := anObject
]

{ #category : #'initialize-release' }
CLGeneratedClasses >> initialize [ 
	super initialize.
	arrayClasses := Set new.
	callbackClasses := Set new.
	enumClasses := Set new.
	headerClasses := Set new.
	structClasses := Set new.
	unionClasses := Set new.
	opaqueClasses := Set new.
]

{ #category : #accessing }
CLGeneratedClasses >> opaqueClasses [
	^ opaqueClasses
]

{ #category : #accessing }
CLGeneratedClasses >> opaqueClasses: anObject [
	opaqueClasses := anObject
]

{ #category : #accessing }
CLGeneratedClasses >> structClasses [
	^ structClasses
]

{ #category : #accessing }
CLGeneratedClasses >> structClasses: anObject [
	structClasses := anObject
]

{ #category : #accessing }
CLGeneratedClasses >> unionClasses [
	^ unionClasses
]

{ #category : #accessing }
CLGeneratedClasses >> unionClasses: anObject [
	unionClasses := anObject
]
