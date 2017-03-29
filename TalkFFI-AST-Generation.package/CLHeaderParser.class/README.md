FFIGenerator converts the Clang AST of a header file into smalltalk objects instances of subclasses of CLNode.

it supports incomplete type declaration for structures.

it does not support function overloading for now.

its main usage scenario is:

FFIGenerator new
	headerFile: '/Users/ciprian/Playfield/llvm-3.1/install_clang-x86/include/clang-c/Index.h';
	addOption: '-I/Users/ciprian/Playfield/llvm-3.1/install_clang-x86/include/clang/include';
	generateFFI.