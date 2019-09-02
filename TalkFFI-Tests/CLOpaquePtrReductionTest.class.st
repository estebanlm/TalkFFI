Class {
	#name : #CLOpaquePtrReductionTest,
	#superclass : #TestCase,
	#category : #'TalkFFI-Tests'
}

{ #category : #helpers }
CLOpaquePtrReductionTest >> convertSource: aString [
	| tu ast |
	tu := CLTranslationUnit source: aString.
	tu numDiagnostics > 0
		ifTrue: [ self error: 'parser error' ].
	ast := (CLHeaderParser builder: CLNodeBuilder new)
		tu: tu;
		headerFile: 't.c';
		parseHeader.
	ast accept: CLOpaquePointerReduction  new.
 
	^ ast
]

{ #category : #running }
CLOpaquePtrReductionTest >> setUp [
	TalkFFIAnnouncer reset.
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> structArgPtrReturn [

	^'struct my_struct myFunc(struct my_struct *inarg);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> structArgPtrReturnPtr [

	^'struct my_struct * myFunc(struct my_struct *inarg);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> structArgReturn [

	^'struct my_struct myFunc(struct my_struct inarg);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> structArgReturnPtr [

	^'struct my_struct * myFunc(struct my_struct inarg);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tChainStructReturnPtr [

	^'typedef struct my_struct my_str;
	typedef my_str my_stru;
	typedef my_stru my_struc;
	typedef my_struc my_struct;
	
	my_struct * myFunc(my_struct inStr);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructArg [

	^'typedef struct my_struct my_struct;
	
	void myFunc(my_struct str);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructArgPtr [

	^'typedef struct my_struct my_struct;
	
	void myFunc(my_struct * str);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructPtrArg [

	^'typedef struct my_struct *my_struct_ptr;
	void myFunc(my_struct_ptr str);
	'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructPtrArgPtr [

	^'typedef struct my_struct *my_struct_ptr;
	
	void myFunc(my_struct_ptr * str);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructPtrReturn [

	^'typedef struct my_struct * my_struct;
	
	my_struct myFunc();'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructPtrReturnPtr [

	^'typedef struct my_struct * my_struct;
	
	my_struct * myFunc();'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructReturn [

	^'typedef struct my_struct my_struct;
	
	my_struct myFunc();'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tStructReturnPtr [

	^'typedef struct my_struct my_struct;
	
	my_struct * myFunc(my_struct inStr);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tUnionPtrArg [

	^'typedef union my_union *my_union;
	
	void myFunc(my_union str);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tVoidPtrReturn [
	^ '
	typedef void *my_void;
	
	my_void myFunc();'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tVoidPtrReturn1 [

	^'
	typedef void avoid;
	typedef void *my_void;
	
	my_void myFunc(avoid * x);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tVoidPtrReturn2 [

	^'
	typedef void avoid;
	typedef avoid bvoid;
	typedef bvoid cvoid;
	typedef cvoid *my_void;
	
	my_void myFunc(avoid * x, bvoid * y, cvoid *z);'
]

{ #category : #fixtures }
CLOpaquePtrReductionTest >> tVoidReturnPtr [

	^'typedef void my_void;
	
	my_void * myFunc();'
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testStructArgPtrReturn [
	| result arg returnType|
	result := self convertSource: self structArgPtrReturn.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	returnType := result functionDeclarations first returnType.
	
	self assert: arg type isCLOpaquePtr.
	self assert: returnType isCLStructure .
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testStructArgPtrReturnPtr [
	| result arg returnType|
	result := self convertSource: self structArgPtrReturnPtr.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	returnType := result functionDeclarations first returnType.
	
	self assert: arg type isCLOpaquePtr.
	self assert: returnType isCLOpaquePtr .
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testStructArgReturn [
	| result arg returnType|
	result := self convertSource: self structArgReturn.
	self assert: result types size = 2.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	returnType := result functionDeclarations first returnType.
	
	self assert: arg type isCLStructure.
	self assert: returnType isCLStructure .
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testStructArgReturnPtr [
	| result arg returnType|
	result := self convertSource: self structArgReturnPtr.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	returnType := result functionDeclarations first returnType.
	
	self assert: arg type isCLStructure.
	self assert: returnType isCLOpaquePtr .
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTChainStructReturnPtr [
	| result returnType arg|
	result := self convertSource: self tChainStructReturnPtr.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_struct'.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type declarationName = 'my_struct'.
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructArg [

	| result arg|
	result := self convertSource: self tStructArg.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type canonicalType isCLStructure.
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructArgPtr [

	| result arg|
	result := self convertSource: self tStructArgPtr.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'my_struct'.
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructPtrArg [

	| result arg|
	result := self convertSource: self tStructPtrArg.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type canonicalType isCLOpaquePtr.
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructPtrArgPtr [

	| result arg|
	result := self convertSource: self tStructPtrArgPtr.
	self assert: result types size = 5.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLPointer .
	self assert: arg type pointee isCLTypeAlias.
	self assert: arg type pointee canonicalType isCLOpaquePtr.
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructPtrReturn [
	| result returnType |
	result := self convertSource: self tStructPtrReturn.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLTypeAlias.
	self assert: returnType canonicalType isCLOpaquePtr
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructPtrReturnPtr [

	| result returnType|
	result := self convertSource: self tStructPtrReturnPtr.
	self assert: result types size = 5.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLPointer.
	self assert: returnType pointee isCLTypeAlias.
	self assert: returnType pointee canonicalType isCLOpaquePtr.
	self assert: returnType pointee canonicalType declarationName = 'my_struct'
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructReturn [

	| result returnType|
	result := self convertSource: self tStructReturn.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLTypeAlias.
	self assert: returnType declarationName = 'my_struct'
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTStructReturnPtr [
	| result returnType arg|
	result := self convertSource: self tStructReturnPtr.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_struct'.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type declarationName = 'my_struct'.
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTUnionPtrArg [

	| result arg|
	result := self convertSource: self tUnionPtrArg.
	self assert: result types size = 4.
	self assert: result functions size = 1.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLTypeAlias.
	self assert: arg type canonicalType isCLOpaquePtr.
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTVoidPtrReturn [
	| result returnType  |
	result := self convertSource: self tVoidPtrReturn.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_void'
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTVoidPtrReturn1 [
	| result returnType  |
	result := self convertSource: self tVoidPtrReturn1.
	self assert: result types size = 5.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_void'
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTVoidPtrReturn2 [
	| result returnType arg |
	result := self convertSource: self tVoidPtrReturn2.
	self assert: result types size = 9.
	self assert: result functions size = 1.
	
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_void'.
	
	arg := result functionDeclarations first arguments first.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'avoid'.
	
	arg := result functionDeclarations first arguments second.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'bvoid'.
	
	arg := result functionDeclarations first arguments third.
	self assert: arg type isCLOpaquePtr.
	self assert: arg type declarationName = 'cvoid'
]

{ #category : #testing }
CLOpaquePtrReductionTest >> testTVoidReturnPtr [
	| result returnType  |
	result := self convertSource: self tVoidReturnPtr.
	self assert: result types size = 3.
	self assert: result functions size = 1.
	returnType := result functionDeclarations first returnType.
	self assert: returnType isCLOpaquePtr.
	self assert: returnType declarationName = 'my_void'
]
