testing
testTStructPtrArg

	| result arg|
	result := self convertSource: self tStructPtrArg.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type canonicalType isCLOpaquePtr.