printing
clPrintOn: aStream
	super clPrintOn: aStream.
	aStream nextPutAll: type printString