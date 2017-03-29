visiting
visitCLHeaderDeclarations: aNode
	self
		node: aNode
		kind: #headerDeclarations
		do: [ 
			doTypes
				ifTrue: [ aNode types do: [ :type | type accept: self ] ].
			doFunctions
				ifTrue: [ aNode functions values do: [ :fct | fct last accept: self ] ] ]