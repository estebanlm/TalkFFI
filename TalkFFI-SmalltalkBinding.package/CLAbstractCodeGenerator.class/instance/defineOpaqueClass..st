compiling classes
defineOpaqueClass: aName
	self defineClass: aName superclass: self opaqueSuperclass in: self mappingModel typesCategory