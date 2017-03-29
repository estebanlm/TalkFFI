compiling methods
compileTypeClassInitialization: aName
	self model
		compile:
			('initialize<n><t>super initialize.' , '<n><t>self initializeStructs.' , '<n><t>self initializeEnums.'
				, '<n><t>self initializeCallbacks.' , '<n><t>self initializeArrays.' , '<n><t>self initializeUnions.') expandMacros
		in: (self model metaclassNamed: aName)
		classified: 'class initialization'