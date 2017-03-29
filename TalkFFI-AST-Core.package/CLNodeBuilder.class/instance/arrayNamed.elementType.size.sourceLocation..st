node building
arrayNamed: aName elementType: aCLType size: aNumber sourceLocation: aSourceLocation
	^ CLArray new
		declarationName: aName;
		elementType: aCLType;
		numElements: aNumber;
		sourceLocation: aSourceLocation