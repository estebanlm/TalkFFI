private api
visitType: aType
	| type typeProcessor |
	(type := self kindToPrimaryType: aType kind item) ifNotNil: [ ^ type ].
	types at: aType ifPresent: [ :v | ^ v ].
	typeProcessor := self class clangTypeToProcessorSymbol 
		at: aType kind item 
		ifAbsent: [ ^ self unsupported: aType ].
	^ types at: aType put: (self perform: typeProcessor withArguments: {aType})