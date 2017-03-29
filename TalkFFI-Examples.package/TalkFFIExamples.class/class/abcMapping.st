example-abc
abcMapping
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self abcPath.
	includeDir := path / 'src'.
	options := {('-I' , includeDir fullName). 
		'-DLIN'. '-DSIZEOF_VOID_P=4'. '-DSIZEOF_LONG=4'. '-DSIZEOF_INT=4'}.
	hFiles := self abcHeaders.
	builder := (CLForeign2NBGenerator for: #ABCSynthesis)
		platform: OSPlatform current libPath: (path / 'libabc.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: '';
		ignoreUnsupported;
		generate;
		openChanges.
	^builder 