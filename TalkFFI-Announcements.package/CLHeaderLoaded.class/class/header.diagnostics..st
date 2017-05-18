instance creation
header: aHeader diagnostics: aDiagSet
	^self new initialize;
		header: aHeader;
		diagnosticSet: aDiagSet 