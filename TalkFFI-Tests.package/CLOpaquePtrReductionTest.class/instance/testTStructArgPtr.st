testing
testTStructArgPtr

	| result arg|
	result := self convertSource: self tStructArgPtr.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'my_struct'.