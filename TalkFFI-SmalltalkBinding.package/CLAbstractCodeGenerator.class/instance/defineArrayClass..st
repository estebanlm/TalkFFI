compiling classes
defineArrayClass: aName
	self 
		defineClass: aName 
		superclass: self arraySuperclass 
		in: self mappingModel typesCategory