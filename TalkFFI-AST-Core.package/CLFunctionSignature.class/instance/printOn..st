printing
printOn: aStream
	aStream
		nextPut: $[;
		nextPut: $(.
	arguments do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream
		nextPut: $);
		nextPutAll: ' -> ';
		nextPutAll: returnType printString;
		nextPut: $]