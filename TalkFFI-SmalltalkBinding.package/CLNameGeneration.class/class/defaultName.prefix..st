instance creation
defaultName: aName prefix: aPrefix
	^ self new
		initialize;
		defaultName: aName;
		prefix: aPrefix