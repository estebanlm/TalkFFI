example-llvm-c
llvmc31MappingFctInObjects
	| path includeDir options builder hFiles |
	path := self llvmc31Path.
	includeDir := path / 'include/llvm-c'.
	options := {('-I' , (path / 'include') fullName).
	'-D__STDC_CONSTANT_MACROS'.
	'-D__STDC_LIMIT_MACROS'}.
	hFiles := self llvmc31Headers.
	builder := (CLForeign2NBGenerator for: #LLVM)
		codeGenerationVisitor: CLNativeBoostMappingFctInObjects;
		platform: Smalltalk os libPath: (path / 'lib' / 'libLLVM.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'LL';
		functionFilter: self llvmc31FunctionFilter;
		ffiSelectorBlock: [ :selector | 
					(selector beginsWith: 'LLVM')
						ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
						ifFalse: [ selector uncapitalized ] ];
		ignoreUnsupported;
		checkFunctionAvailability;
		generate;
		openChanges.
	^builder