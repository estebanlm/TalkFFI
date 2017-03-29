compiling classes
defineOpaqueClass: aName
	|ret|
	ret := super defineOpaqueClass: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret