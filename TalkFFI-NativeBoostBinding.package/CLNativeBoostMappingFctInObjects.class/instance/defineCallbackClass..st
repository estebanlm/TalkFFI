compiling classes
defineCallbackClass: aName
	|ret|
	ret := super defineCallbackClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret