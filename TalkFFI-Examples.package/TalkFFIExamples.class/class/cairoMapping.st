example-cairo
cairoMapping
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self cairoPath.
	includeDir := path / 'include/cairo'.
	options := {('-I' , (path / 'include/cairo') fullName)}.
	hFiles := self cairoHeaders.
	builder := (CLForeign2NBGenerator for: #LibCairo)
		platform: NativeBoostConstants mac32PlatformId libPath: (path / 'lib/libcairo.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'Cairo';
		ignoreUnsupported;
		generate;
		openChanges.
	^builder