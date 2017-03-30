compiling classes
defineStructClass: aName
	super defineStructClass: aName.
	self compileNbBindingOf: aName.
	^ self generatedClasses structClasses add: aName