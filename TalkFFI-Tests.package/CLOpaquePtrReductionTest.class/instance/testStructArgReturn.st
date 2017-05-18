testing
testStructArgReturn
	| result arg returnType|
	result := self convertSource: self structArgReturn.
	self assert: result types size = 2.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	returnType := result functionDeclarations first returnType.
	
	self assert: arg type isCLStructure.
	self assert: returnType isCLStructure .