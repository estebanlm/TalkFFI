generating ffi binding
wrapperForHeader: aHeaderSpec
	"create the wrapper class for the headerName "

	| headerAST |
	headerAST := (CLHeaderParser builder: CLNodeBuilder new)
		headerFile: aHeaderSpec fileName;
		compilationOptions: aHeaderSpec compilationOptions;
		functionFilter: mappingModel functionFilter;
		parseHeader.
	headerAST accept: CLOpaquePointerReduction new.
	headerAST accept: (CLNameGeneration defaultName: headerAST declarationName prefix: mappingModel classPrefix).
	^ headerAST
		accept:
			(self codeGenerationVisitor new
				mappingModel: mappingModel)