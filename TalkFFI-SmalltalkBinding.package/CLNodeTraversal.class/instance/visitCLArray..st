visiting
visitCLArray: aNode
	self node: aNode kind: #array do: [ aNode elementType accept: self ]