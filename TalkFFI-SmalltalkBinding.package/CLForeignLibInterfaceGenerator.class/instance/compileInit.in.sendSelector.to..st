compiling methods
compileInit: aName in: aClass sendSelector: aSelector to: aClassList
	| methodString |
	methodString := aName , Character cr asString.
	methodString := aClassList
		inject: methodString
		into: [ :str :each | str , Character cr asString , each , ' ' , aSelector , '.' ].
	self model compile: methodString in: aClass classified: 'class initialization'