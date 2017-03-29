visiting
visitCLArgument: aNode
	self node: aNode kind: #argument do: [ aNode type accept: self ]