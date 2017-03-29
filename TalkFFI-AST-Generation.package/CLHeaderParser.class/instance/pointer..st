private type builders
pointer: aType
	^ builder pointerTo: (self visitType: aType pointeeType) sourceLocation: (self typeLocation: aType)