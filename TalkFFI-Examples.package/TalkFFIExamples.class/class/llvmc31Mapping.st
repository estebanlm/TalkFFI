example-llvm-c
llvmc31Mapping
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self llvmc31Path.
	includeDir := path / 'include/llvm-c'.
	options := {('-I' , (path / 'include') fullName).
	'-D__STDC_CONSTANT_MACROS'.
	'-D__STDC_LIMIT_MACROS'}.
	hFiles := self llvmc31Headers.
	builder := (CLForeign2NBGenerator for: #LLVM)
		platform: Smalltalk os libPath: (path / 'lib/libLLVM-3.1.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'LL';
		ffiSelectorBlock: [ :selector | 
					(selector beginsWith: 'LLVM')
						ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
						ifFalse: [ selector uncapitalized ] ];
		ignoreUnsupported;
		generate;
		openChanges.
	^builder