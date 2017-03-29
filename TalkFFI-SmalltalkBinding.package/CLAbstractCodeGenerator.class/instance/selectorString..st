string generation
selectorString: aNamedSignature
	| idx rStream wStream wasSelf |
	wStream := String new writeStream.
	rStream := aNamedSignature last readStream.
	wStream nextPutAll: aNamedSignature second.
	idx := 1.
	wasSelf := false.
	[ rStream atEnd ]
		whileFalse: [ 
			| arg argName |
			arg := rStream next.
			(arg isKindOf: Association)
				ifTrue: [ 
					argName := arg value.
					argName isEmpty
						ifTrue: [ argName := 'arg' , idx printString ].
					(idx = 1 or: [ wasSelf ])
						ifFalse: [ wStream nextPutAll: argName ].
					wStream
						nextPut: $:;
						space;
						nextPutAll: argName uncapitalized;
						space.
					wasSelf := false ]
				ifFalse: [ wasSelf := true ].
			idx := idx + 1 ].
	^ wStream contents