example-libarchfpga
libarchfpgaMapping
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self libarchfpgaPath.
	includeDir := path / 'include'.
	options := {('-I' , includeDir fullName). ('-I', (path  / '../printhandler/SRC/TIO_InputOutputHandlers') fullName )}.
	hFiles := self libarchfpgaHeaders.
	builder := (CLForeign2NBGenerator for: #VTR)
		platform: NativeBoostConstants mac32PlatformId libPath: (path / '../Build/Products/Debug/libarchfpga.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: '';
		ignoreUnsupported;
		checkFunctionAvailability;
		generate;
		openChanges.
	^builder 