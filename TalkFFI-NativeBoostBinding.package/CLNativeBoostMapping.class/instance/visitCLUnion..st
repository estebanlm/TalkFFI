visiting
visitCLUnion: aNode
	| node fields uName  |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	node := self mapping at: aNode put: aNode declarationName.
	fields := aNode fields collect: [ :field | field accept: self ].
	fields isEmpty
		ifTrue: [ 
			"If the union does not have any fields then it is used just in typedefs such as: typedef union myunion *mytype_t;"
			^ self mapping at: aNode put: self opaque ].
	uName := self defineUnionClass: node.
	self compileUnionSpec: fields in: (self metaclassNamed: uName).
	^ node