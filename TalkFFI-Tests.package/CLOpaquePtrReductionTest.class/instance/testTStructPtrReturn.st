testing
testTStructPtrReturn
	| result returnType |
	result := self convertSource: self tStructPtrReturn.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLTypeAlias.
	self assert: returnType canonicalType isCLOpaquePtr