Class {
	#name : #CLHeaderLoaded,
	#superclass : #Announcement,
	#instVars : [
		'header',
		'diagnosticSet'
	],
	#category : 'TalkFFI-Announcements'
}

{ #category : #'instance creation' }
CLHeaderLoaded class >> header: aHeader diagnostics: aDiagSet [
	^self new initialize;
		header: aHeader;
		diagnosticSet: aDiagSet 
]

{ #category : #accessing }
CLHeaderLoaded >> diagnosticSet [
	^ diagnosticSet
]

{ #category : #accessing }
CLHeaderLoaded >> diagnosticSet: anObject [
	diagnosticSet := anObject
]

{ #category : #accessing }
CLHeaderLoaded >> header [
	^ header
]

{ #category : #accessing }
CLHeaderLoaded >> header: anObject [
	header := anObject
]
