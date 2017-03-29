accessing
category
	^ category ifNil: [ category := self libraryName , '-FFI' ] ifNotNil: [ category ]