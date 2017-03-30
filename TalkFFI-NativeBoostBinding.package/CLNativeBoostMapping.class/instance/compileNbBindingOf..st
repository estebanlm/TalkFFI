compiling methods
compileNbBindingOf: aClassName
	self
		compile: ('ffiBindingOf: aTypeName<n><t>^ <1s><n><t><t>typeAt: aTypeName<n><t><t>ifAbsent: [ super ffiBindingOf: aTypeName ]' 
			expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'ffi types'