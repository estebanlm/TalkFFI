printing
printOn: aStream
	aStream nextPut: $[.
	declarationName printOn: aStream.
	aStream nextPutAll: '-->'.
	canonicalType printOn: aStream.
	aStream nextPut: $]