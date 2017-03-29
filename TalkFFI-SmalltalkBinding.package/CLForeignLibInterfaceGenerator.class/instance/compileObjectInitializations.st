compiling methods
compileObjectInitializations
	|gClasses|
	gClasses :=  self mappingModel generatedClasses.
	self
		compileInit: 'initializeStructs'
		in: self typeClass
		sendSelector: 'rebuildFieldAccessors'
		to: gClasses structClasses.
	self
		compileInit: 'initializeEnums'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses enumClasses.
	self
		compileInit: 'initializeCallbacks'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses callbackClasses.
	self
		compileInit: 'initializeUnions'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses unionClasses.
	self
		compileInit: 'initializeArrays'
		in: self typeClass
		sendSelector: 'initialize'
		to: gClasses arrayClasses.