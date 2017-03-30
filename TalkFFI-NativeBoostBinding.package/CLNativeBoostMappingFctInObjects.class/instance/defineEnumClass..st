compiling classes
defineEnumClass: aName
	|ret|
	ret := super defineEnumClass: aName.
	self compileNbBindingOf: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret