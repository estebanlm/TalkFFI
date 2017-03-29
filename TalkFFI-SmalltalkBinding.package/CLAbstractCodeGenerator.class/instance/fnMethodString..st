string generation
fnMethodString: aNamedSignature
	| methodTemplate |
	
	methodTemplate := '<1s><n><t>^self ffiCall: <2s>'
		expandMacrosWithArguments:
			{(self selectorString: aNamedSignature).
			(self fnSignatureString: aNamedSignature) }.

	^ methodTemplate, ((mayGC at: aNamedSignature second) 
		ifTrue: [ ' options: #( optMayGC )' ] 
		ifFalse: [ '' ])