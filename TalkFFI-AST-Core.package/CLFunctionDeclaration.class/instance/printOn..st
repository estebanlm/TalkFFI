printing
printOn: aStream
	self returnType printOn: aStream.
	aStream
		nextPut: $ ;
		nextPutAll: self declarationName;
		nextPut: $(.
	self arguments do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)