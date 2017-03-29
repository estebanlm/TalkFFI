visiting
visitCLEnumeration: aNode
	| node  eName |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	eName := self defineEnumClass: aNode declarationName.
	self compileEnumSpec: aNode items in: (self metaclassNamed: eName).
	^ self mapping at: aNode put: eName