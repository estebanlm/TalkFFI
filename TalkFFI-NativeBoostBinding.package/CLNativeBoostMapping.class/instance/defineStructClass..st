compiling classes
defineStructClass: aName
	super defineStructClass: aName.
	"self compileNbBindingOf: aName."
	"self compileTypeAnnotation: #NBExternalStructureType in: aName."
	^ self generatedClasses structClasses add: aName