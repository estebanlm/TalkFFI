compiling methods
compileFnSpec: aSignature in: aClass
	self 
		compile: (self fnSpecString: aSignature) 
		in: aClass 
		classified: 'accessing'