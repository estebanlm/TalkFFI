visiting
visitCLHeaderDeclarations: aNode
	|   node |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	headerClass := self defineHClass: aNode declarationName.
	mayGC := aNode accept: CLFunctionsThatMayGC new.
	 aNode types do: [ :each | each accept: self ].	
	"here we need to solve the case of multiple definitions of the same function"
	"do not consider overloads for now, just get the last definition"
	aNode functions values do: [ :each | each last accept: self ]