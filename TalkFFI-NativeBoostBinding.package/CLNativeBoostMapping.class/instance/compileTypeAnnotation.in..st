compiling methods
compileTypeAnnotation: aTypeName in: aClassName
	self halt.
	self
		compile: ('asNBExternalType: gen<n><t>^<1s> objectClass: self' expandMacrosWith: aTypeName)
		in: (self metaclassNamed: aClassName)
		classified: 'nativeboost mapping'