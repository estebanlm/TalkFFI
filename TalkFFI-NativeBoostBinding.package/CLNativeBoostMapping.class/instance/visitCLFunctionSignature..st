visiting
visitCLFunctionSignature: aNode
	| node returnType args |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	returnType := aNode returnType accept: self.
	args := aNode arguments collect: [ :each | each accept: self ].
	^ self mapping
		at: aNode
		put:
			{returnType.
			args}