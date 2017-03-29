printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	self clPrintOn: aStream.
	aStream nextPut: $]