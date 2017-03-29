compiling classes
defineHClass: aName
	super defineHClass: aName.
	"self compileNbBindingOf: aName."
	self compileNbLibraryNameOrHandle: aName.
	^ self generatedClasses headerClasses add: aName