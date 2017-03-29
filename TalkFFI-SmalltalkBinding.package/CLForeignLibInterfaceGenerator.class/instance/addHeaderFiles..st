accessing
addHeaderFiles: aCollection
	aCollection do:[:each | self addHeaderFile: each].