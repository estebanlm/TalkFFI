visiting
visitCLPrimary: aNode
	| node |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	^self  mapping 
		at: aNode 
		put: (self class primariesToNbTypes at: aNode declarationName) asString