visiting
visitCLStructure: aNode
	| node fields sName  |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	node := self mapping at: aNode put: aNode declarationName.
	fields := aNode fields collect: [ :field | field accept: self ].
	fields isEmpty
		ifTrue: [ 
			"If the structure does not have any fields then it is used just in typedefs such as: typedef struct MyStruct *mytype_t;"
			^ self mapping at: aNode put: self opaque ].
	sName := self defineStructClass: node.
	self compileStructSpec: fields in: (self metaclassNamed: sName).
	^ node