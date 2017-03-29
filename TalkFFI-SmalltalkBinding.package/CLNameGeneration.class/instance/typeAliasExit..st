actions
typeAliasExit: aNode
	(aNode canonicalType isCLPointer and: [ aNode canonicalType pointee isCLFunctionSignature ])
		ifTrue: [ self node: aNode suffix: '' ]