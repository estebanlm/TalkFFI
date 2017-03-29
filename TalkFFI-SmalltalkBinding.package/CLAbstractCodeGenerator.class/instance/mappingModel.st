accessing
mappingModel
	^ mappingModel isNil
		ifTrue: [ mappingModel := CLMappingModel new ]
		ifFalse: [ mappingModel ]