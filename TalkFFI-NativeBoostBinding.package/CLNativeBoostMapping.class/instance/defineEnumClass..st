compiling classes
defineEnumClass: aName
	super defineEnumClass: aName.
	^ self generatedClasses enumClasses add: aName