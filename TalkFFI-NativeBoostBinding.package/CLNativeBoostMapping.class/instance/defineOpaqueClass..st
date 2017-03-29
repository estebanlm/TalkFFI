compiling classes
defineOpaqueClass: aName
	super defineOpaqueClass: aName.
	"self compileNbBindingOf: aName."
	^ self generatedClasses opaqueClasses add: aName