visiting
visitCLFunctionDeclaration: aNode
	self node: aNode kind: #functionDeclaration do: [ aNode signature accept: self ]