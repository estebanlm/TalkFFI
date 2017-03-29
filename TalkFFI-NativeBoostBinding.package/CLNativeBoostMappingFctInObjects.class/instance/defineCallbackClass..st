compiling classes
defineCallbackClass: aName
	|ret|
	ret := super defineCallbackClass: aName.
	"self compileNbLibraryNameOrHandle: aName."
	self compileExternalTypeAlias: aName.
	"self compileInstanceNbLibraryNameOrHandle: aName."
	^ret