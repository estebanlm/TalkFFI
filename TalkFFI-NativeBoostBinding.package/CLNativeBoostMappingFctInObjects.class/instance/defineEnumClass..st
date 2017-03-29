compiling classes
defineEnumClass: aName
	|ret|
	ret := super defineEnumClass: aName.
	self compileNbBindingOf: aName.
	self compileNbLibraryNameOrHandle: aName.
	self compileExternalTypeAlias: aName.
	self compileInstanceNbLibraryNameOrHandle: aName.
	^ret