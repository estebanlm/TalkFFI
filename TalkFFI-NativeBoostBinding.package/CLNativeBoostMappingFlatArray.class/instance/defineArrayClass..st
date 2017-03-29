compiling classes
defineArrayClass: aName
	super defineArrayClass: aName.
	"self compileNbBindingOf: aName."
	"self compileTypeAnnotation: #NBExternalStructureType in: aName."
	^ self generatedClasses arrayClasses add: aName