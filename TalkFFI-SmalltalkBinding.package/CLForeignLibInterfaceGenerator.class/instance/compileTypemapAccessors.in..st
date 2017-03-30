compiling methods
compileTypemapAccessors: aTypemap in: aClass
	self model 
		compile: ('typeMap<n><t> ^ TypeMap ifNil: [ TypeMap := self createTypeMap ]' expandMacros) 
		in: (self model metaclassNamed: aClass) 
		classified: 'private'.
		
	self model 
		compile: ('typeAt: key ifAbsent: aBlock<n><t> ^ self typeMap at: key ifAbsent: aBlock' expandMacros) 
		in: (self model metaclassNamed: aClass) 
		classified: 'accessing'