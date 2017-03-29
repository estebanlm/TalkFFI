node building
enumNamed: aName type: aCLType sourceLocation: aLocation
	^ CLEnumeration new
		declarationName: aName;
		type: aCLType;
		sourceLocation: aLocation