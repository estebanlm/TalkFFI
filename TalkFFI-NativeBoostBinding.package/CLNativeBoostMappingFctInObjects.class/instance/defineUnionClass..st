compiling classes
defineUnionClass: aName
	|ret|
	ret := super defineUnionClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret