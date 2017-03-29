visiting
visitCLTypeAlias: aNode
	self node: aNode kind: #typeAlias do: [ aNode canonicalType accept: self ]