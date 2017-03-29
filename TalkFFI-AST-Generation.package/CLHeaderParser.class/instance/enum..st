private type builders
enum: aType
	| callback enum |
	enum := builder
		enumNamed: (self typeName: aType)
		type: (self visitType: aType declaration enumType)
		sourceLocation: (self typeLocation: aType).
	callback := self cursorVisitorClass 
		on: [ :cursor :parent :data | 
			builder enum: enum at: cursor spelling put: cursor enumValue.
			self childVisitContinue ].
	aType declaration visitChildren: callback.
	^ enum