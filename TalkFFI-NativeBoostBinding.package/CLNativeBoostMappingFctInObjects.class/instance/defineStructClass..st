compiling classes
defineStructClass: aName
	|ret|
	ret := super defineStructClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret