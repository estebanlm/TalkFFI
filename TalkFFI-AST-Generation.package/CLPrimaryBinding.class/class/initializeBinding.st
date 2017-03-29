class initialization
initializeBinding
	| binding eDecl|
	eDecl :=  self typeKindClass enumDecl.
	binding := Dictionary new.
	
	5 to: (eDecl indexOf: #CXType_LongDouble) by: 2 do:[:idx |
		|item|
		item := (eDecl at: idx).
		self primaryNamed: (item copyFrom: 8 to: item size) asLowercase asSymbol in: binding
		].
	binding at: #firstbuiltin put: (binding at: #void).
	^ binding