compiling methods
compileTypemap: aTypemap in: aClass
	| typeMapString |
	typeMapString := 'typeMap<n><t>^#(<1s>)'
		expandMacrosWith:
			(aTypemap associations
				inject: String new
				into: [ :str :a | str , a key asString , ' ' , a value printString , Character cr asString ]).
	self model compile: typeMapString in: (self model metaclassNamed: aClass) classified: 'type map'