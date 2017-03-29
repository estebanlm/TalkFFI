string generation
fieldsString: fields
	| rStream wStream |
	wStream := String new writeStream cr.
	rStream := fields readStream.
	[ rStream atEnd ]
		whileFalse: [ 
			| field |
			field := rStream next.
			wStream
				tab;
				nextPutAll: field key;
				space;
				nextPutAll: field value;
				nextPut: $;;
				cr ].
	^ wStream contents