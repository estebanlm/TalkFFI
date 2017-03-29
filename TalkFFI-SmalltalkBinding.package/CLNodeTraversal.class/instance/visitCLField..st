visiting
visitCLField: aNode
	self node: aNode kind: #field do: [ aNode type accept: self ]