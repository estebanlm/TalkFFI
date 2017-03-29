visiting
visitCLArgument: aNode
	| node type |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	type := aNode type accept: self.
	^ self mapping at: aNode put: type -> aNode declarationName