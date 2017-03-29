node building
argumentNamed: aName type: aCLType sourceLocation: aLocation
	^ CLArgument new
		declarationName: aName;
		type: aCLType;
		sourceLocation: aLocation