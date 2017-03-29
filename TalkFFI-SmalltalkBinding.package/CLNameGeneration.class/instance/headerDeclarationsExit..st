actions
headerDeclarationsExit: aNode
	| name |
	name := self prefix , (self camelFromString: aNode declarationName).
	name at: name size put: name last asUppercase.
	aNode declarationName: name asSymbol