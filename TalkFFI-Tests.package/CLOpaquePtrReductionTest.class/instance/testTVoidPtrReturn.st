testing
testTVoidPtrReturn
	| result returnType  |
	result := self convertSource: self tVoidPtrReturn.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_void'