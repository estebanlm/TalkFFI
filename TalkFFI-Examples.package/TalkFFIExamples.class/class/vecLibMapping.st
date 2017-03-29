example-vecLib
vecLibMapping
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self vecLibPath.
	includeDir := path / 'Headers'.
	options := {('-I' , (path / 'Headers') fullName)}.
	hFiles := self vecLibHeaders.
	builder := (CLForeign2NBGenerator for: #VecLib)
		platform: NativeBoostConstants mac32PlatformId libPath: (path / 'vecLib.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'VL';
		ignoreUnsupported;
		generate;
		openChanges.
	^builder 