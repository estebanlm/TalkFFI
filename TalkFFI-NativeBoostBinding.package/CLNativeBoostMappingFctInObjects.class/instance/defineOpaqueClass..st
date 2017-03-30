compiling classes
defineOpaqueClass: aName
	|ret|
	ret := super defineOpaqueClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret