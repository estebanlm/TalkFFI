compiling
compileExternalTypeAlias: aClassName
	self
		compile: ('externalTypeAlias: aTypeName<n><t>^ <1s><n><t><t>typeAt: aTypeName<n><t><t>ifAbsent:[ aTypeName ]' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'ffi types'