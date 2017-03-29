private type builders
recordFrom: aType
	| cursor |
	cursor := aType declaration.
	cursor isStructDecl
		ifTrue: [ ^ builder structNamed: (self typeName: aType) sourceLocation: (self typeLocation: aType) ].
	cursor isUnionDecl
		ifTrue: [ ^ builder unionNamed: (self typeName: aType) sourceLocation: (self typeLocation: aType) ]