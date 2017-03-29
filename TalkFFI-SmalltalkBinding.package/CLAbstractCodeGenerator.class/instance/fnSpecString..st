string generation
fnSpecString: aSignature
	^ 'fnSpec<n><t>^<1s>' expandMacrosWith: (self fnSignatureString: aSignature)