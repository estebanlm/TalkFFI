testing
testStructArgPtrReturnPtr
	| result arg returnType|
	result := self convertSource: self structArgPtrReturnPtr.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	returnType := result functionDeclarations first returnType.
	
	self assert: arg type isCLOpaquePtr.
	self assert: returnType isCLOpaquePtr .