visiting
visitCLFunctionDeclaration: aNode
	| node signature  |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	self checkAvailability: aNode declarationName.
	signature := aNode signature accept: self.
	^ self compileFnCall: aNode declarationName signature: signature in: (self classNamed: headerClass)