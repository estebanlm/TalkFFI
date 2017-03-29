printing
printOn: aStream
	aStream
		nextPutAll: self type printString;
		nextPutAll: ' ';
		nextPutAll: self declarationName asString