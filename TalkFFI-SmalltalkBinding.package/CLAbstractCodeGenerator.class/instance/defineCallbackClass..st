compiling classes
defineCallbackClass: aName
	self 
		defineClass: aName 
		superclass: self callbackSuperclass 
		in: self mappingModel typesCategory