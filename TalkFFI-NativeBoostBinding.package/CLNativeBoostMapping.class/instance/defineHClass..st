compiling classes
defineHClass: aName
	super defineHClass: aName.
	self compileNbBindingOf: aName.
	self compileFFILibraryName: aName.
	^ self generatedClasses headerClasses add: aName