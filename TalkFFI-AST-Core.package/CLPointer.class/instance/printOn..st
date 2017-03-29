printing
printOn: aStream
	aStream nextPut: $[.
	pointee printOn: aStream.
	aStream nextPut: $*.
	aStream nextPut: $]