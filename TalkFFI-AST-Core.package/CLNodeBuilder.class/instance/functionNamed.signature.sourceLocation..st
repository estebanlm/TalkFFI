node building
functionNamed: aName signature: aCLFunctionSignature sourceLocation: aLocation
	^ CLFunctionDeclaration new
		declarationName: aName;
		signature: aCLFunctionSignature;
		sourceLocation: aLocation