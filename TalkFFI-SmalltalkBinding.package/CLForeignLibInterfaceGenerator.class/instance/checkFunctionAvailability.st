generating ffi binding
checkFunctionAvailability
	mappingModel libraryPath: (libraryPaths asDictionary 
		at: Smalltalk os 
		ifAbsent: [ nil ])