example-libgit2
libgit2Mapping
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self libgit2Path.
	includeDir := path / 'include'.
	options := {('-I' , includeDir fullName)}.
	hFiles := self libgit2Headers.
	builder := (CLForeign2NBGenerator for: #LibGit2)
		platform: Smalltalk os libPath: (path / 'build/libgit2.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'LG2';
		ffiSelectorBlock: [ :selector | 
					(selector beginsWith: 'git_')
						ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
						ifFalse: [ selector uncapitalized ] ];
		ignoreUnsupported;
		generate;
		openChanges.
	^ builder