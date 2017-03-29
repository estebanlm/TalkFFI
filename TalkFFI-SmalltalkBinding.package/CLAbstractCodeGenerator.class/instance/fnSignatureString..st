string generation
fnSignatureString: aSignature
	| wStream rStream idx |
	wStream := String new writeStream.
	wStream
		nextPutAll: aSignature first asString;
		space.
	aSignature size = 3
		ifTrue: [ wStream nextPutAll: aSignature second ].
	wStream nextPut: $(.
	rStream := aSignature last readStream.
	idx := 1.
	[ rStream atEnd ]
		whileFalse: [ 
			| arg |
			arg := rStream next.
			(arg isKindOf: Association)
				ifTrue: [ 
					wStream
						nextPutAll: arg key asString;
						space;
						nextPutAll:
								(arg value isEmpty
										ifTrue: [ 'arg' , idx printString ]
										ifFalse: [ arg value uncapitalized ]) ]
				ifFalse: [ wStream nextPutAll: 'self' ].
			rStream peek
				ifNotNil: [ 
					wStream
						nextPut: $,;
						space ].
			idx := idx + 1 ].
	wStream nextPut: $).
	^ '#(<1s>)' expandMacrosWith: wStream contents