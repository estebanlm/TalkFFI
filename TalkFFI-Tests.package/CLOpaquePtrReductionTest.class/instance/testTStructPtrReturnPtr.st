testing
testTStructPtrReturnPtr

	| result returnType|
	result := self convertSource: self tStructPtrReturnPtr.
	self assert: result types size = 5.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLPointer.
	self assert: returnType pointee isCLTypeAlias.
	self assert: returnType pointee canonicalType isCLOpaquePtr.
	self assert: returnType pointee canonicalType declarationName = 'my_struct'