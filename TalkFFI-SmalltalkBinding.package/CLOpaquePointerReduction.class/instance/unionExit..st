actions
unionExit: aNode
	| oPtr parent |
	aNode fields ifNotEmpty: [ ^ self ].
	parent := self pointerParent.
	parent ifNil: [ ^ self ].
	oPtr := CLOpaquePtr new
		declarationName: parent pointee declarationName;
		sourceLocation: parent sourceLocation.
	opaques at: parent put: oPtr