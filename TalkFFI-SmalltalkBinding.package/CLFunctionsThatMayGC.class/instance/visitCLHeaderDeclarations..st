visiting
visitCLHeaderDeclarations: aNode
	^(aNode functions values collect: [ :each | each last accept: self ]) asDictionary 