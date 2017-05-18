testing
testTStructReturn

	| result returnType|
	result := self convertSource: self tStructReturn.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLTypeAlias.
	self assert: returnType declarationName = 'my_struct'