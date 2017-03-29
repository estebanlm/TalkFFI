compiling methods
compileNbLibraryNameOrHandle: aClassName
	self
		compile:
			('nbLibraryNameOrHandle<n><t>^ <1s> libraryNameOrHandle' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'library path'