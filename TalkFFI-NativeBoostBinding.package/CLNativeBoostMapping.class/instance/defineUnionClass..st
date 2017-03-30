compiling classes
defineUnionClass: aName
	super defineUnionClass: aName.
	self compileNbBindingOf: aName.
	^ self generatedClasses unionClasses add: aName