visiting
visitCLStructure: aNode
	self node: aNode kind: #structure do: [ aNode fields do: [ :field | field accept: self ] ]