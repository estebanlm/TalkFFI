visiting
visitCLFunctionDeclaration: aNode
	^ aNode declarationName
		-> (((aNode signature arguments collect: [ :each | each accept: self ]) select: [ :e | e ]) notEmpty)