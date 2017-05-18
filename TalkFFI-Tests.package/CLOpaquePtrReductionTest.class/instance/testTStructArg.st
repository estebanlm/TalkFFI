testing
testTStructArg

	| result arg|
	result := self convertSource: self tStructArg.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type canonicalType isCLStructure.