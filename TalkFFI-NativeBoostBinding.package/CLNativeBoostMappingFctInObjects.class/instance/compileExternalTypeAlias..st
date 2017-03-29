compiling
compileExternalTypeAlias: aClassName
	self flag: #fixMe. "Verify this method"
	self
		compile: ('externalTypeAlias: aTypeName<n><t>^ <1s> at: aTypeName ifAbsent:[aTypeName]' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'nativeboost types'