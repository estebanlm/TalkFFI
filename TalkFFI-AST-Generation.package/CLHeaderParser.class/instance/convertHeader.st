private api
convertHeader
	| idx |
	tu isNil
		ifTrue: [ 
			idx := self indexClass default.
			tu := idx translationUnitFromSource: self headerFile options: compilationOptions ].
	TalkFFIAnnouncer uniqueInstance announce: (CLHeaderLoaded header: self headerFile diagnostics: tu diagnosticSet).
	tu cursor visitChildren: self functionsVisitor.
	^ builder
		headerNamed: self headerFileName
		types: self types
		functions: self functions
		unmappable: unmappable
		sourceLocation:
			{(self headerFile).
			0.
			0}