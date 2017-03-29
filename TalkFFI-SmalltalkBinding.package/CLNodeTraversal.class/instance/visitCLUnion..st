visiting
visitCLUnion: aNode
	self node: aNode kind: #union do: [ aNode fields do: [ :field | field accept: self ] ]