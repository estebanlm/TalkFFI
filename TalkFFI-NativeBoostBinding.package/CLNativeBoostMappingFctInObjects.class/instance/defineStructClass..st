compiling classes
defineStructClass: aName
	|ret|
	ret := super defineStructClass: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret