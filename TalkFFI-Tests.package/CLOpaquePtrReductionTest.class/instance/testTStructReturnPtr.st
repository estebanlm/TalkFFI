testing
testTStructReturnPtr
	| result returnType arg|
	result := self convertSource: self tStructReturnPtr.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_struct'.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type declarationName = 'my_struct'.