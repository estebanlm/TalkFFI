visiting
visitCLArray: aNode
	| node elementType sName fields |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	node := self mapping at: aNode put: aNode declarationName.
	elementType := aNode elementType accept: self.
	fields := (1 to: aNode numElements) collect: [ :idx | elementType -> ('data' , idx printString) ].
	sName := self defineArrayClass: node.
	self compileStructSpec: fields in: (self metaclassNamed: sName).
	^ node