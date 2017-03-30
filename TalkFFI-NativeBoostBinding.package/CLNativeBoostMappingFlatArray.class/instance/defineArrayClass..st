compiling classes
defineArrayClass: aName
	super defineArrayClass: aName.
	self compileNbBindingOf: aName.
	^ self generatedClasses arrayClasses add: aName