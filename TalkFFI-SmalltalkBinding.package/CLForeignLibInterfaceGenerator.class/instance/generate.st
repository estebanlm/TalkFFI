generating ffi binding
generate
	self compileTypesClass.
	headerSpecs do: [ :each | self wrapperForHeader: each ].
	self 
		compileTypemap: self mappingModel typemap 
		in: self mappingModel typemapClassName.
	self 
		compileTypemapAccessors: self mappingModel typemap 
		in: self mappingModel typemapClassName.
	self compileObjectInitializations.
	libraryPaths asDictionary keysAndValuesDo: [ :platform :path | 
		self model 
			compile: (self moduleNameStringFor: platform path: path) 
			in: self instanceClass  
			classified: 'library path' ]