visiting
visitCLEnumeration: aNode
	self node: aNode kind: #enumeration do: [ aNode type accept: self ]