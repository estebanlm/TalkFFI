path := FileDirectory on: '/Users/ciprian/Playfield/llvm-3.1/install_clang-x86_dbg/'.
indexH := CLHeaderSpecification new
	fileName: (path / 'include/clang-c/Index.h') fullName ; 
	addOption: '-I', (path / 'include/clang/include') fullName.
	
builder := (CLForeignLibInterfaceGenerator for: #LibClang)
	platform: NativeBoostConstants mac32PlatformId libPath: (path / 'lib/libclang.dylib') fullName;
	addHeader: indexH;
	classPrefix: 'CX';
	ffiSelectorBlock: [:selector | (selector beginsWith: 'clang_') ifTrue:[selector copyFrom: 7 to: selector size] ifFalse: [ selector]];
	generate;
	openChanges.
	
or for multiple files 

path := FileDirectory on: '/Users/ciprian/Playfield/llvm-3.1/install_clang-x86/'.
includeDir := path / 'include/llvm-c'.
options := { '-I', (path / 'include') fullName.
	 '-D__STDC_CONSTANT_MACROS'.
	 '-D__STDC_LIMIT_MACROS'}.
	 
builder := (CLForeignLibInterfaceGenerator for: #LibLLVM)
	platform: NativeBoostConstants mac32PlatformId libPath: (path / 'lib/libLLVM.dylib') fullName;
	compilationOptions: options;
	includeDir: includeDir;
	addHeaderFiles: {'Core.h'. 'Object.h'. 'Analysis.h'. 'BitReader.h'. 'BitWriter.h'. 'Target.h'. 'TargetMachine.h'};
	classPrefix: 'LL';
	ffiSelectorBlock: [:selector | (selector beginsWith: 'LLVM') ifTrue:[(selector copyFrom: 5 to: selector size) withFirstCharacterDownshifted] ifFalse: [ selector withFirstCharacterDownshifted]];
	generate;
	openChanges.
	
