accessing
functionFilter: aBlock
	aBlock ifNil: [ ^ self ].
	functionFilter := aBlock