compiling methods
compileEnumSpec: items in: aClass
	self compile: (self enumSpecString: items) in: aClass classified: 'enum declaration'