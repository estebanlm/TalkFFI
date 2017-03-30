string generation
moduleNameStringFor: platform path: path
	^'<1s>ModuleName<n><t> ^ <2p>.' 
		expandMacrosWith: (self platformPrefix: platform)   
		with: path