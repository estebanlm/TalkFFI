visiting
visitCLPointer: aNode
	| node pointeeType |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	pointeeType := aNode pointee accept: self.
	aNode pointee isCLFunctionSignature
		ifTrue: [ 
			| cName |
			cName := self defineCallbackClass: aNode pointee declarationName.
			self compileFnSpec: pointeeType in: (self metaclassNamed: cName).
			^ self mapping at: aNode put: cName ].
	((self resolveType: pointeeType) isKindOf: FFICharacterType) 
		ifTrue:[ ^self mapping at: aNode put: #String ].
	pointeeType = #FFIExternalString 
		ifTrue:[ ^self mapping at: aNode put: #char, ' **'].
	^ self mapping at: aNode put: pointeeType , ' *'