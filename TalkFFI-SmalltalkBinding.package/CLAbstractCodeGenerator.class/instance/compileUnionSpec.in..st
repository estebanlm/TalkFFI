compiling methods
compileUnionSpec: fields in: aClass
	"union and structs have similar spec strings only semantics change"

	self compile: (self unionSpecString: fields) in: aClass classified: 'accessing'