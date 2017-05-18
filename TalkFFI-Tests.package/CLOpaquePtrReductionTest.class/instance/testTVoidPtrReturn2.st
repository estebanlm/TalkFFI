testing
testTVoidPtrReturn2
	| result returnType arg |
	result := self convertSource: self tVoidPtrReturn2.
	self assert: result types size = 9.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_void'.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'avoid'.
	
	arg := result functionDeclarations first arguments second.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'bvoid'.
	
	arg := result functionDeclarations first arguments third.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'cvoid'