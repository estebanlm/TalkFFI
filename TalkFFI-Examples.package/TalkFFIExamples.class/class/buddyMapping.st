example-buddy
buddyMapping
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self buddyPath.
	includeDir := path / 'include'.
	options := {('-I' , includeDir fullName)}.
	hFiles := self buddyHeaders.
	builder := (CLForeign2NBGenerator for: #Buddy)
		platform: Smalltalk os libPath: (path / 'lib/libbdd.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: '';
		ignoreUnsupported;
		ffiSelectorBlock: self buddySelectorTrimmer;
		generate;
		openChanges.
	^builder 