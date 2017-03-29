visiting
visitCLFunctionDeclaration: aNode
	| node signature compObj compClass defaultBlock |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	self checkAvailability: aNode declarationName.
	signature := aNode signature accept: self.
	defaultBlock := [ self compileFnCall: aNode declarationName signature: signature in: (self classNamed: headerClass) ].	
	"get the type of the first argument"
	signature last ifNotEmpty: [ compObj := self classFor: signature last first key ].
	^ compObj
		ifNil: [ 
			compClass := self metaclassFor: signature first.
			compClass
				ifNil: [ defaultBlock value ]
				ifNotNil: [ self compileFnCall: aNode declarationName signature: signature in: compClass ] ]
		ifNotNil: [ 
			signature := signature deepCopy.
			signature last at: 1 put: 'self'.
			self compileFnCall: aNode declarationName signature: signature in: compObj ]