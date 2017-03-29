example-llvm-c
llvmc31FunctionFilter
	^ [ :headerFile :cursor | 
	| currentFile |
	currentFile := cursor location presumedLocation first.
	currentFile = headerFile or: [ (headerFile endsWith: 'Target.h') and: [ currentFile endsWith: '.def' ] ] ]