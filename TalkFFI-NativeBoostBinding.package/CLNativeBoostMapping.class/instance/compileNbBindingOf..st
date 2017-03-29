compiling methods
compileNbBindingOf: aClassName
	self flag: #fixMe. "Verify this"
	self
		compile: ('nbBindingOf: aTypeName<n><t>^ <1s> at: aTypeName' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'nativeboost types'