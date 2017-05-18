testing
testTVoidPtrReturn1
	| result returnType  |
	result := self convertSource: self tVoidPtrReturn1.
	self assert: result types size = 5.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_void'