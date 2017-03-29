string generation
selectorString: aNamedSignature
	^ self ffiSelectorBlock value: (super selectorString: aNamedSignature)