compiling methods
compileFnCall: aName signature: aSignature in: aClass

	self
		compile:
			(self
				fnMethodString:
					{(aSignature first).
					aName.
					(aSignature last)})
		in: aClass
		classified: 'foreign interface'