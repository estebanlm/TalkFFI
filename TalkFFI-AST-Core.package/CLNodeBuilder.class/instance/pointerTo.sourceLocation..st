node building
pointerTo: aPointee sourceLocation: aLocation
	^ CLPointer new
		pointee: aPointee;
		sourceLocation: aLocation