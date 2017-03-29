compiling methods
compileStructSpec: fields in: aClass
	self compile: (self structSpecString: fields) in: aClass classified: 'accessing'