private type builders
function: aType
	| returnType arguments fctCursor |
	returnType := self visitType: aType resultType.
	fctCursor := aType declaration.
	arguments := aType argumentTypes
		withIndexCollect: [ :argT :idx | 
			| arg argName |
			arg := self visitType: argT.
			argName := (fctCursor argumentAt: idx) spelling.
			argName isEmpty
				ifTrue: [ argName := 'arg' , idx printString ].
			builder argumentNamed: argName type: arg sourceLocation: (self typeLocation: argT) ].
	^ builder arguments: arguments returnType: returnType sourceLocation: (self typeLocation: aType)