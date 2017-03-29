node building
unsupportedNamed: aName type: aTypeKind sourceLocation: aSrcLoc
	^ CLUnsupported new
		declarationName: aName;
		type: aTypeKind;
		sourceLocation: aSrcLoc