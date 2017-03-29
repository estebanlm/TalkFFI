example-libclang
libClang31Mapping
	| indexH builder path |
	self logClangErrorsInTranscript.
	path := self libClang31Path.
	indexH := CLHeaderSpecification new
		fileName: (path / 'include/clang-c/Index.h') fullName;
		addOption: '-I' , (path / 'include/clang/include') fullName.
	builder := (CLForeign2NBGenerator for: #LibClangTest)
		platform: NativeBoostConstants mac32PlatformId libPath: (path / 'lib/libclang.dylib') fullName;
		addHeader: indexH;
		classPrefix: 'CLang';
		ffiSelectorBlock: [ :selector | 
					(selector beginsWith: 'clang_')
						ifTrue: [ selector copyFrom: 7 to: selector size ]
						ifFalse: [ selector ] ];
		ignoreUnsupported;
		generate;
		openChanges.
	^builder.