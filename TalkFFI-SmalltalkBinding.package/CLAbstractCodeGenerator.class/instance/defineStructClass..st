compiling classes
defineStructClass: aName
	self 
		defineClass: aName 
		superclass: self structSuperclass 
		in: self mappingModel typesCategory