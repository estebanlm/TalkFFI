accessing
defaultName: anObject
	defaultName := self camelFromString: anObject.
	defaultName at: defaultName size put: defaultName last asUppercase