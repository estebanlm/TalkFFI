accessing
opaque
	^ opaque isNil
		ifTrue: [ opaque := (CLPrimary named: #void) accept: self ]
		ifFalse: [ opaque ]