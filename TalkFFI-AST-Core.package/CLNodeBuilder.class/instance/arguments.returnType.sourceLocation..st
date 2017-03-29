node building
arguments: argList returnType: aCLType sourceLocation: aLocation
	^ CLFunctionSignature new
		arguments: argList;
		returnType: aCLType;
		sourceLocation: aLocation