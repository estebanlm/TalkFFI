private type builders
record: aType
	| recordDecl |
	recordDecl := types at: aType canonical put: (self recordFrom: aType).
	aType declaration visitChildren: (self recordVisitorCallback: recordDecl).
	^ recordDecl