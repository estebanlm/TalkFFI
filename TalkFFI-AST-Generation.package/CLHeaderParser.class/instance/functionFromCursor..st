private api
functionFromCursor: aFunctionCursor
	| fctName fct |
	fctName := aFunctionCursor spelling.
	fct := builder
		functionNamed: fctName
		signature: (self visitType: aFunctionCursor type)
		sourceLocation: aFunctionCursor location presumedLocation.
	fct signature function: fct.
	fct signature arguments
		withIndexDo: [ :arg :idx | arg declarationName: (aFunctionCursor argumentAt: idx - 1) spelling ].
	functions
		at: fctName
		ifPresent: [ :value | value add: fct ]
		ifAbsent: [ functions at: fctName put: (OrderedCollection with: fct) ].
	^ fct