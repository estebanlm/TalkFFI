helpers
convertSource: aString
	| tu ast |
	tu := CLTranslationUnit source: aString.
	tu numDiagnostics > 0
		ifTrue: [ self error: 'parser error' ].
	ast := (CLHeaderParser builder: CLNodeBuilder new)
		tu: tu;
		headerFile: 't.c';
		parseHeader.
	ast accept: CLOpaquePointerReduction  new.
	^ ast