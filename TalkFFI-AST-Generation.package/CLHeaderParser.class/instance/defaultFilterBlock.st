accessing
defaultFilterBlock
	^ [ :file :cursor | 
	singleFile
		ifTrue: [ cursor location presumedLocation first = file ]
		ifFalse: [ true ] ]