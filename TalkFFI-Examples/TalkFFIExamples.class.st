Class {
	#name : #TalkFFIExamples,
	#superclass : #Object,
	#category : #'TalkFFI-Examples'
}

{ #category : #'example-abc' }
TalkFFIExamples class >> abcHeaders [
	^{
	'base/abc/abc.h'.
	}
]

{ #category : #'example-abc' }
TalkFFIExamples class >> abcMapping [
	<example>
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self abcPath.
	includeDir := path / 'src'.
	options := {('-I' , includeDir fullName).
	'-DLIN'.
	'-DSIZEOF_VOID_P=4'.
	'-DSIZEOF_LONG=4'.
	'-DSIZEOF_INT=4'}.
	hFiles := self abcHeaders.
	builder := (CLForeign2NBGenerator for: #ABCSynthesis)
		platform: OSPlatform current
			libPath: (path / 'libabc.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: '';
		ignoreUnsupported;
		generate;
		openChanges.
	^ builder
]

{ #category : #'example-abc' }
TalkFFIExamples class >> abcPath [
	^FileReference / 'Users/ciprian/Playfield/repositories/abc'
]

{ #category : #'example-aio' }
TalkFFIExamples class >> aioMapping [
	<example>
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.

	path := FileReference / #usr / #include  .
	includeDir := path.
	options := {('-I' , path fullName)}.
	hFiles := {'signal.h'}.
	builder := (CLForeign2NBGenerator for: #LibRT)
		platform: OSPlatform current libPath: '/usr/lib/libc.dylib';
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'RT';
		ignoreUnsupported;
		generate;
		openChanges.
	^ builder
]

{ #category : #'example-buddy' }
TalkFFIExamples class >> buddyHeaders [
	^{
	'bdd.h'.
	'fdd.h'.
	'bvec.h'
	}
]

{ #category : #'example-buddy' }
TalkFFIExamples class >> buddyMapping [
	<example>
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self buddyPath.
	includeDir := path / 'include'.
	options := {('-I' , includeDir fullName)}.
	hFiles := self buddyHeaders.
	builder := (CLForeign2NBGenerator for: #Buddy)
		platform: OSPlatform current
			libPath: (path / 'lib/libbdd.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: '';
		ignoreUnsupported;
		ffiSelectorBlock: self buddySelectorTrimmer;
		generate;
		openChanges.
	^ builder
]

{ #category : #'example-buddy' }
TalkFFIExamples class >> buddyPath [
	^FileReference / 'Users/ciprian/Playfield/stuff-builds/buddy-2.4'
]

{ #category : #'example-buddy' }
TalkFFIExamples class >> buddySelectorTrimmer [
	^ [ :selector | 
	(selector beginsWith: 'bdd')
		ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
		ifFalse: [ 
			(selector beginsWith: 'fdd')
				ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
				ifFalse: [ 
					(selector beginsWith: 'bvec')
						ifTrue: [ (selector copyFrom: 6 to: selector size) uncapitalized ]
						ifFalse: [ selector uncapitalized ] ] ] ]
]

{ #category : #'example-cairo' }
TalkFFIExamples class >> cairoHeaders [
	^ {
	'cairo.h'.
	'cairo-deprecated.h'.
	'cairo-svg.h'.
	'cairo-features.h'.
	'cairo-tee.h'.
	'cairo-ft.h'.
	'cairo-version.h'.
	'cairo-gobject.h'.
	'cairo-xcb.h'.
	'cairo-pdf.h'.
	'cairo-xlib-xrender.h'.
	'cairo-ps.h'.
	'cairo-xlib.h'.
	'cairo-script-interpreter.h'.
	'cairo-xml.h'.
	'cairo-script.h'.
	}
]

{ #category : #'example-cairo' }
TalkFFIExamples class >> cairoMapping [
	<example>
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self cairoPath.
	includeDir := path / 'include/cairo'.
	options := {('-I' , (path / 'include/cairo') fullName)}.
	hFiles := self cairoHeaders.
	builder := (CLForeign2NBGenerator for: #LibCairo)
		platform: OSPlatform current
			libPath: (path / 'lib/libcairo.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'Cairo';
		ignoreUnsupported;
		generate;
		openChanges.
	^ builder
]

{ #category : #'example-cairo' }
TalkFFIExamples class >> cairoPath [
	^FileReference / 'opt/local/'
]

{ #category : #helpers }
TalkFFIExamples class >> existsOrAsk: aPath for: aLibraryName [
	aPath exists
		ifFalse: [ ^ UIManager default chooseDirectory: 'Choose ', aLibraryName, ' directory:' ].
	^ aPath
]

{ #category : #'example-libclang' }
TalkFFIExamples class >> libClang31Mapping [
	<example>
	| indexH builder path |
	self logClangErrorsInTranscript.
	path := self libClang31Path.
	indexH := CLHeaderSpecification new
		fileName: (path / 'include/clang-c/Index.h') fullName;
		addOption: '-I' , (path / 'include/clang/include') fullName.
	builder := (CLForeign2NBGenerator for: #LibClangTest)
		platform: OSPlatform current
			libPath: (path / 'lib/libclang.dylib') fullName;
		addHeader: indexH;
		classPrefix: 'CLang';
		ffiSelectorBlock: [ :selector | 
			(selector beginsWith: 'clang_')
				ifTrue: [ selector copyFrom: 7 to: selector size ]
				ifFalse: [ selector ] ];
		ignoreUnsupported;
		generate;
		openChanges.
	^ builder
]

{ #category : #'example-libclang' }
TalkFFIExamples class >> libClang31Path [
	^ self existsOrAsk: FileReference / 'Users/ciprian/Playfield/llvm-3.1/install_clang-x86_dbg/' for: 'LibClang'
]

{ #category : #'example-libarchfpga' }
TalkFFIExamples class >> libarchfpgaHeaders [
	^{
	'read_xml_arch_file.h'.
	}
]

{ #category : #'example-libarchfpga' }
TalkFFIExamples class >> libarchfpgaMapping [
	<example>
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self libarchfpgaPath.
	includeDir := path / 'include'.
	options := {('-I' , includeDir fullName).
	('-I'
		, (path / '../printhandler/SRC/TIO_InputOutputHandlers') fullName)}.
	hFiles := self libarchfpgaHeaders.
	builder := (CLForeign2NBGenerator for: #VTR)
		platform: OSPlatform current
			libPath: (path / '../Build/Products/Debug/libarchfpga.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: '';
		ignoreUnsupported;
		checkFunctionAvailability;
		generate;
		openChanges.
	^ builder
]

{ #category : #'example-libarchfpga' }
TalkFFIExamples class >> libarchfpgaPath [
	^FileReference / 'Users/ciprian/Playfield/ReCoNF/vtr-bindings/vtr/libarchfpga/'
]

{ #category : #'example-libgit2' }
TalkFFIExamples class >> libgit2Headers [
        ^ {'git2.h'.
'git2/version.h'.

'git2/common.h'.
'git2/threads.h'.
'git2/errors.h'.

'git2/types.h'.

'git2/oid.h'.
'git2/signature.h'.
'git2/odb.h'.

'git2/repository.h'.
'git2/revwalk.h'.
'git2/merge.h'.
'git2/graph.h'.
'git2/refs.h'.
'git2/reflog.h'.
'git2/revparse.h'.

'git2/object.h'.
'git2/blob.h'.
'git2/commit.h'.
'git2/tag.h'.
'git2/tree.h'.
'git2/diff.h'.

'git2/index.h'.
'git2/config.h'.
'git2/transport.h'.
'git2/remote.h'.
'git2/clone.h'.
'git2/checkout.h'.
'git2/push.h'.

'git2/attr.h'.
'git2/ignore.h'.
'git2/branch.h'.
'git2/refspec.h'.
'git2/net.h'.
'git2/status.h'.
'git2/indexer.h'.
'git2/submodule.h'.
'git2/notes.h'.
'git2/reset.h'.
'git2/message.h'.
'git2/pack.h'.
'git2/stash.h'.}
]

{ #category : #'example-libgit2' }
TalkFFIExamples class >> libgit2Mapping [
	<example>
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self libgit2Path.
	includeDir := path / 'include'.
	options := {('-I' , includeDir fullName)}.
	hFiles := self libgit2Headers.
	builder := (CLForeign2NBGenerator for: #LibGit2)
		platform: OSPlatform current
			libPath: (path / 'build/libgit2.dylib') fullName;
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
]

{ #category : #'example-libgit2' }
TalkFFIExamples class >> libgit2Path [
	^ self existsOrAsk: FileReference / 'Users/Ciprian/Downloads/libgit2-development/' for: 'LibGit2'.
]

{ #category : #'example-llvm-c' }
TalkFFIExamples class >> llvmc31FunctionFilter [
	^ [ :headerFile :cursor | 
	| currentFile |
	currentFile := cursor location presumedLocation first.
	currentFile = headerFile or: [ (headerFile endsWith: 'Target.h') and: [ currentFile endsWith: '.def' ] ] ]
]

{ #category : #'example-llvm-c' }
TalkFFIExamples class >> llvmc31Headers [
	^ {'Analysis.h'.
	'BitReader.h'.
	'BitWriter.h'.
	'Core.h'.
	'Disassembler.h'.
	'EnhancedDisassembly.h'.
	'ExecutionEngine.h'.
	'Initialization.h'.
	'Object.h'.
	'Target.h'.
	'TargetMachine.h'.
	'Transforms/IPO.h'.
	'Transforms/PassManagerBuilder.h'.
	'Transforms/Scalar.h'.
	'Transforms/Vectorize.h'}
]

{ #category : #'example-llvm-c' }
TalkFFIExamples class >> llvmc31LTOHeaders [
	^ {
	'lto.h'.
	}
]

{ #category : #'example-llvm-c' }
TalkFFIExamples class >> llvmc31LTOMappingFctInObjects [
	<example>
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
]

{ #category : #'example-llvm-c' }
TalkFFIExamples class >> llvmc31Mapping [
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self llvmc31Path.
	includeDir := path / 'include/llvm-c'.
	options := {('-I' , (path / 'include') fullName).
	'-D__STDC_CONSTANT_MACROS'.
	'-D__STDC_LIMIT_MACROS'}.
	hFiles := self llvmc31Headers.
	builder := (CLForeign2NBGenerator for: #LLVM)
		platform: OSPlatform current libPath: (path / 'lib/libLLVM-3.1.dylib') fullName;
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
]

{ #category : #'example-llvm-c' }
TalkFFIExamples class >> llvmc31MappingFctInObjects [
	<example>
	| path includeDir options builder hFiles |
	path := self llvmc31Path.
	includeDir := path / 'include/llvm-c'.
	options := {('-I' , (path / 'include') fullName).
	'-D__STDC_CONSTANT_MACROS'.
	'-D__STDC_LIMIT_MACROS'}.
	hFiles := self llvmc31Headers.
	builder := (CLForeign2NBGenerator for: #LLVM)
		codeGenerationVisitor: CLNativeBoostMappingFctInObjects;
		platform: OSPlatform current libPath: (path / 'lib' / 'libLLVM.dylib') fullName;
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
]

{ #category : #'example-llvm-c' }
TalkFFIExamples class >> llvmc31Path [
	^ self existsOrAsk: './out' asFileReference for: 'LLVM'
]

{ #category : #helpers }
TalkFFIExamples class >> logClangErrorsInTranscript [
	TalkFFIAnnouncer reset.
	TalkFFIAnnouncer uniqueInstance
		on: CLHeaderLoaded
		do: [ :ann | 
			| headerName |
			headerName := ann header copyFrom: (ann header lastIndexOf: $/) to: ann header size.
			ann diagnosticSet isEmpty
				ifTrue: [ 
					Transcript
						show: headerName , ' loaded.';
						cr ]
				ifFalse: [ 
					Transcript
						show: headerName , ' loaded with: ';
						cr.
					ann diagnosticSet
						do: [ :diag | 
							Transcript
								tab;
								show: diag defaultDiagnosticFormat;
								cr ] ] ].
	Transcript open.
]

{ #category : #'example-vecLib' }
TalkFFIExamples class >> vecLibHeaders [
	^{
	'cblas.h'.
	'clapack.h'.
	}
]

{ #category : #'example-vecLib' }
TalkFFIExamples class >> vecLibMapping [
	<example>
	| path includeDir options builder hFiles |
	self logClangErrorsInTranscript.
	path := self vecLibPath.
	includeDir := path / 'Headers'.
	options := {('-I' , (path / 'Headers') fullName)}.
	hFiles := self vecLibHeaders.
	builder := (CLForeign2NBGenerator for: #VecLib)
		platform: OSPlatform current
			libPath: (path / 'vecLib.dylib') fullName;
		compilationOptions: options;
		includeDir: includeDir;
		addHeaderFiles: hFiles;
		classPrefix: 'VL';
		ignoreUnsupported;
		generate;
		openChanges.
	^ builder
]

{ #category : #'example-vecLib' }
TalkFFIExamples class >> vecLibPath [
	^FileReference / 'System/Library/Frameworks/vecLib.framework'
]
