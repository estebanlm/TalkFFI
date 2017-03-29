compiling classes
defineCallbackClass: aName
	| name |
	name := aName.
	name ifNil: [ name := (headerClass , 'CbAnon' , (idx := idx + 1) printString) asSymbol ].
	super defineCallbackClass: name.
	self compileNbBindingOf: name.
	^ self generatedClasses callbackClasses add: name