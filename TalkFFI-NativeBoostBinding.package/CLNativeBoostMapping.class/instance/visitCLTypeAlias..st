visiting
visitCLTypeAlias: aNode
	| node canonicalType |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	node := self mapping at: aNode put: aNode declarationName.
	canonicalType := aNode canonicalType accept: self.
	(aNode canonicalType isCLPointer and: [ aNode canonicalType pointee isCLFunctionSignature ])
		ifTrue: [ 
			self defineCallbackClass: aNode declarationName superclass: canonicalType.
			self mapping at: aNode canonicalType put: aNode declarationName ]
		ifFalse: [ 
			"here we alias the canonical type to the declaration name"
			self typemap at: node asString put: canonicalType asString ].
	^ node