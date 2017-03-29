visiting
visitCLUnion: aNode
	"	overwritten to stop recursivity "
	self node: aNode kind: #union do: [ ]