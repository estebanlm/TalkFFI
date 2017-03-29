testing
checkAvailability: aFctName
	self mappingModel libraryPath ifNil: [ ^ self ].
	[ ExternalAddress loadSymbol: aFctName module: self mappingModel libraryPath ] 
	on: PrimitiveFailed do: [ :e | 
			Transcript
				show: 'Missing ' , aFctName , ' ' , self mappingModel libraryPath asPath basename;
				cr ]