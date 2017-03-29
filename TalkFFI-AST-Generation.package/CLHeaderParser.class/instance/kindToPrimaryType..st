private api
kindToPrimaryType: aTypeKindItem
	^ self builder
		primaryNamed: (aTypeKindItem copyFrom: 8 to: aTypeKindItem size) asSymbol asLowercase
		using: CLPrimaryBinding