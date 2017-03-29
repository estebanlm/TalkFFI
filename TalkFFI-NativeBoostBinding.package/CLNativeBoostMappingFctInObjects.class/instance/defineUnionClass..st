compiling classes
defineUnionClass: aName
	|ret|
	ret := super defineUnionClass: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret