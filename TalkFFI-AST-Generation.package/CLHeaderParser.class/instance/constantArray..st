private type builders
constantArray: aType
	^ builder
		arrayNamed: (self typeName: aType)
		elementType: (self visitType: aType arrayElementType)
		size: aType arraySize
		sourceLocation: (self typeLocation: aType)