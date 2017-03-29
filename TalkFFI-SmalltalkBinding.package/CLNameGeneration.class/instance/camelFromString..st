private
camelFromString: aString
	| prevIsLetter newString |
	prevIsLetter := false.
	newString := aString
		inject: String new
		into: [ :str :ch | 
			| nCh |
			nCh := ch.
			ch isLetter
				ifTrue: [ 
					prevIsLetter
						ifFalse: [ nCh := ch asUppercase ].
					prevIsLetter := true ]
				ifFalse: [ prevIsLetter := false ].
			nCh isAlphaNumeric
				ifTrue: [ str , nCh asString ]
				ifFalse: [ str ] ].
	(newString isEmpty or: [ newString first isLetter not ])
		ifTrue: [ newString := 'V' , newString ].
	^ newString