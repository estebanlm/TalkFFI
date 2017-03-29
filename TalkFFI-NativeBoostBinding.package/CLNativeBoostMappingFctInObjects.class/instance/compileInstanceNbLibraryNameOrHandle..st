compiling
compileInstanceNbLibraryNameOrHandle: aClassName
	self flag: #fixMe. "Verify method (and rename it)"
	self
		compile: 'ffiLibraryName<n><t>^ self class ffiLibraryName' expandMacros 
		in: (self classNamed: aClassName)
		classified: 'library path'