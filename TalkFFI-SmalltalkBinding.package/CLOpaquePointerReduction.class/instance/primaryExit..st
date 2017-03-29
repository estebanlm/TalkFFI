actions
primaryExit: aNode
	| parent grandParent oPtr   |
	aNode declarationName = #void
		ifFalse: [ ^ self ].
	parent := self pointerParent.
	parent ifNil: [ ^ self ].
	grandParent := self parentOf: parent.
	(grandParent isNil or: [ grandParent isCLTypeAlias not ])
		ifTrue: [ 
			parent pointee isCLTypeAlias
				ifFalse: [ ^ self ].
			oPtr := CLOpaquePtr new
				declarationName: parent pointee declarationName;
				sourceLocation: parent pointee sourceLocation.
			opaques at: parent put: oPtr.
			^ self ].
	oPtr := CLOpaquePtr new
		declarationName: grandParent declarationName;
		sourceLocation: grandParent sourceLocation.
	opaques at: grandParent put: oPtr