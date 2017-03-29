visiting
visitCLPointer: aNode
	self node: aNode kind: #pointer do: [ aNode pointee accept: self ]