private api
unsupported: aType
	^ types
		at: aType canonical
		put:
			(unmappable
				add:
					(builder
						unsupportedNamed: (self typeName: aType)
						type: aType kind -> aType declaration kind
						sourceLocation: (self typeLocation: aType)))