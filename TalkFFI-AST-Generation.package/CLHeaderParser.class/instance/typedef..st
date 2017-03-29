private type builders
typedef: aType
	^ builder
		aliasNamed: (self typeName: aType)
		of: (self visitType: aType canonical)
		sourceLocation: (self typeLocation: aType)