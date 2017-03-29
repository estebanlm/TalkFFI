visiting
visitCLStructure: aNode
	"	overwritten to stop recursivity "
	self node: aNode kind: #structure do: [ ]