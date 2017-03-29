generating ffi binding
generate
	self compileTypesClass.
	headerSpecs do: [ :each | self wrapperForHeader: each ].
	self compileTypemap: self mappingModel typemap in: self mappingModel typemapClassName.
	self compileObjectInitializations.
	self model compile: self libraryHandleMethodString in: self typeClass  classified: 'library path'.