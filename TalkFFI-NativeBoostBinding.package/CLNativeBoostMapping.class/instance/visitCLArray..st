visiting
visitCLArray: aNode
	| node elementType arName |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	elementType := aNode elementType accept: self.
	arName := self defineArrayClass: elementType.
	self
		compile: ('arrayDecl <n><t>^#(<1s> <2p>)' expandMacrosWith: elementType with: aNode numElements)
		in: (self metaclassNamed: arName)
		classified: 'array initialization'.
	(RBRenameClassRefactoring
		model: self rbModel
		rename: (self classNamed: arName)
		to: (arName := arName , aNode numElements printString)) transform.
	^ self mapping
		at: aNode
		put: (arName , '[' , (aNode numElements ifNil: [ '' ] ifNotNil: [ aNode numElements printString ]) , ']') asSymbol