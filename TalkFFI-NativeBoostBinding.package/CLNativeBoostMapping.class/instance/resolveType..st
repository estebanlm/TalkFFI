private
resolveType: pointeeType
	^ [ FFIExternalType resolveType: pointeeType ] 
		ifError: [ nil ]
	