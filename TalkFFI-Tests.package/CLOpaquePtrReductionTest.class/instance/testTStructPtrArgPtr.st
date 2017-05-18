testing
testTStructPtrArgPtr

	| result arg|
	result := self convertSource: self tStructPtrArgPtr.
	self assert: result types size = 5.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLPointer .
	self assert: arg type pointee isCLTypeAlias.
	self assert: arg type pointee canonicalType isCLOpaquePtr.