actions
headerDeclarationsExit: aNode
	| keys values |
	keys := Array new: opaques size.
	values := Array new: opaques size.
	opaques associations
		withIndexDo: [ :a :idx | 
			keys at: idx put: a key.
			values at: idx put: a value ].
	keys elementsForwardIdentityTo: values