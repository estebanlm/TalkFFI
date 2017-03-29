compiling classes
defineUnionClass: aName
	super defineUnionClass: aName.
	"self compileNbBindingOf: aName.
	self compileTypeAnnotation: #NBExternalUnionType in: aName."
	^ self generatedClasses unionClasses add: aName