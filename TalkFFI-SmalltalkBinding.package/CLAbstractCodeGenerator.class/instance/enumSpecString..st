string generation
enumSpecString: items
	|  rStream wStream |
	rStream := (items associations asSortedCollection: [ :a :b | a value < b value ]) readStream.
	wStream := String new writeStream cr.
	[ rStream atEnd ]
		whileFalse: [ 
			| item |
			item := rStream next.
			wStream
				tab;
				nextPutAll: item key asString;
				space;
				nextPutAll: item value printString;
				cr ].
	^ 'enumDecl<n><t>^#(<1s>)' expandMacrosWith: wStream contents