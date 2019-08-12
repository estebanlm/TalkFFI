Class {
	#name : #TalkFFIAnnouncer,
	#superclass : #Announcer,
	#classVars : [
		'Instance'
	],
	#category : 'TalkFFI-Announcements'
}

{ #category : #'as yet unclassified' }
TalkFFIAnnouncer class >> reset [
	Instance := self new.
]

{ #category : #'as yet unclassified' }
TalkFFIAnnouncer class >> uniqueInstance [
	^Instance ifNil: [Instance := self new] ifNotNil:[Instance]
]
