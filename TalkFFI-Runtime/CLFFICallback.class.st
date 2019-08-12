Class {
	#name : #CLFFICallback,
	#superclass : #FFICallback,
	#category : 'TalkFFI-Runtime'
}

{ #category : #accessing }
CLFFICallback class >> fnSpec [ 
	self subclassResponsibility
]

{ #category : #'instance creation' }
CLFFICallback class >> on: aBlock [
	^ self signature: self fnSpec block: aBlock
]
