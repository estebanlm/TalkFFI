visiting
visitCLOpaquePtr: aNode
	| node  eName |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	eName := self defineOpaqueClass: aNode declarationName.
	^ self mapping at: aNode put: eName