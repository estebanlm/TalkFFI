as yet unclassified
clangTypeToProcessorSymbol
	| map |
	map := Dictionary new.
	map add: #CXType_Unexposed -> #unexposed:.	
	map add: #CXType_Typedef -> #typedef:.
	map add: #CXType_Enum -> #enum:.
	map add: #CXType_Pointer -> #pointer:.
	map add: #CXType_Record -> #record:.
	map add: #CXType_FunctionProto -> #function:.
	map add: #CXType_FunctionNoProto -> #function:.
	map add: #CXType_ConstantArray -> #constantArray:.
	
	map add: #CXType_BlockPointer -> #unsupported:. 
	map add: #CXType_Complex -> #unsupported:.
	map add: #CXType_LValueReference -> #unsupported:.
	map add: #CXType_RValueReference -> #unsupported:.
	map add: #CXType_ObjCInterface -> #unsupported:.
	map add: #CXType_ObjCObjectPointer -> #unsupported:.
	map add: #CXType_Vector -> #unsupported:.
	
	map add: #CXType_Elaborated -> #unexposed:.
	
	^ map