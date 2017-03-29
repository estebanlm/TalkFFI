helpers
existsOrAsk: aPath for: aLibraryName
	aPath exists
		ifFalse: [ ^ UIManager default chooseDirectory: 'Choose ', aLibraryName, ' directory:' ].
	^ aPath