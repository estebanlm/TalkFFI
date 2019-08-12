Class {
	#name : #CLHeaderSpecification,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'compilationOptions'
	],
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #accessing }
CLHeaderSpecification >> addOption: anOptionString [
	compilationOptions add: anOptionString.
]

{ #category : #accessing }
CLHeaderSpecification >> compilationOptions [
	^ compilationOptions
]

{ #category : #accessing }
CLHeaderSpecification >> compilationOptions: anObject [
	compilationOptions := anObject
]

{ #category : #accessing }
CLHeaderSpecification >> fileName [
	^ fileName
]

{ #category : #accessing }
CLHeaderSpecification >> fileName: anObject [
	fileName := anObject
]

{ #category : #'initialize-release' }
CLHeaderSpecification >> initialize [ 
	super initialize.
	compilationOptions := OrderedCollection new.
]
