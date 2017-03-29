node building
aliasNamed: aName of: aCLType sourceLocation: aLocation
	^ CLTypeAlias new
		declarationName: aName;
		canonicalType: aCLType;
		sourceLocation: aLocation