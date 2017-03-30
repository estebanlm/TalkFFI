compiling methods
compileFFILibraryName: aClassName
	self
		compile:
			('ffiLibraryName<n><t>^ <1s>' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'library path'.
			
	self
		compile:
			('ffiLibraryName<n><t>^ self class ffiLibraryName' expandMacrosWith: self mappingModel typemapClassName)
		in: (self classNamed: aClassName)
		classified: 'library path'