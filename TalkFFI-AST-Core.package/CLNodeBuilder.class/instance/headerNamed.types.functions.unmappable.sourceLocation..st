node building
headerNamed: aName types: someTypes functions: someFunctions unmappable: someUnmappableTypes sourceLocation: aLocation
	^ CLHeaderDeclarations new
		declarationName: aName;
		types: someTypes;
		functions: someFunctions;
		unmappable: someUnmappableTypes;
		sourceLocation: aLocation