helpers
logClangErrorsInTranscript
	TalkFFIAnnouncer reset.
	TalkFFIAnnouncer uniqueInstance
		on: CLHeaderLoaded
		do: [ :ann | 
			| headerName |
			headerName := ann header copyFrom: (ann header lastIndexOf: $/) to: ann header size.
			ann diagnosticSet isEmpty
				ifTrue: [ 
					Transcript
						show: headerName , ' loaded.';
						cr ]
				ifFalse: [ 
					Transcript
						show: headerName , ' loaded with: ';
						cr.
					ann diagnosticSet
						do: [ :diag | 
							Transcript
								tab;
								show: diag defaultDiagnosticFormat;
								cr ] ] ].
	Transcript open.