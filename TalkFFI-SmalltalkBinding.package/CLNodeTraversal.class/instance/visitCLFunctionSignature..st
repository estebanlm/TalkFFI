visiting
visitCLFunctionSignature: aNode
	self
		node: aNode
		kind: #functionSignature
		do: [ 
			aNode returnType accept: self.
			aNode arguments do: [ :arg | arg accept: self ] ]