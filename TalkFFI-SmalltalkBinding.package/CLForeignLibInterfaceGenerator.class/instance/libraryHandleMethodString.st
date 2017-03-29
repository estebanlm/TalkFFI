string generation
libraryHandleMethodString
	| rStream wStream |
	wStream := String new writeStream.
	wStream nextPutAll: 'libraryNameOrHandle'; cr; tab.
	rStream := libraryPaths asOrderedCollection readStream.
	[ rStream atEnd ]
		whileFalse: [ 
			| lPath str |
			lPath := rStream next.
			str := '<1s> = <2p> <n><t><t>ifTrue:[^<3p>].' 
					expandMacrosWith: self platformIdGetter 
					with: lPath key 
					with: lPath value.
			wStream nextPutAll: str;
				cr; 
				tab ].
	wStream nextPutAll: 'self error: ''define your own path'''.
	^wStream contents