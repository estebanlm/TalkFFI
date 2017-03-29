initialize-release
initialize 
	super initialize.
	headerSpecs  := OrderedCollection new.
	libraryPaths := Set new.
	mappingModel := CLMappingModel new.
	compilationOptions := OrderedCollection new.