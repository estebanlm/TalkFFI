example-llvm-c
llvmc31LTOMappingFctInObjects
	| path includeDir options builder hFiles |
	path := self llvmc31Path.
	includeDir := path / 'include/llvm-c'.
	options := {('-I' , (path / 'include') fullName).
	'-D__STDC_CONSTANT_MACROS'.
	'-D__STDC_LIMIT_MACROS'}.
	hFiles := self llvmc31LTOHeaders.
	builder := (CLForeign2NBGenerator for: #LLVMLTO)
		codeGenerationVisitor: CLNativeBoostMappingFctInObjects;
		platform: Smalltalk os libPath: (path / 'lib' / 'libLTO.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'LTO';
		ffiSelectorBlock: [ :selector | 
					(selector beginsWith: 'lto')
						ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
						ifFalse: [ selector uncapitalized ] ];
		ignoreUnsupported;
		checkFunctionAvailability;
		generate;
		openChanges.
	^builder