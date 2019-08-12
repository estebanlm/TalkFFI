Class {
	#name : #CLHeader,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'TalkFFI-Runtime'
}

{ #category : #'instance creation' }
CLHeader class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
CLHeader class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]
