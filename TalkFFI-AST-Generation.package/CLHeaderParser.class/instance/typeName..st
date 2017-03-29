private api
typeName: aType
	| tname |
	tname := aType declaration spelling.
	tname ifEmpty: [ ^ ($@ split: aType declaration usr) last ].
	"tname size > 0 ifFalse:[^nil]."
	^ tname