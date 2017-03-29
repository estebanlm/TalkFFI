accessing
functionDeclarations
	" ignore overloaded functions"

	^ functions values collect: [ :each | each first ]