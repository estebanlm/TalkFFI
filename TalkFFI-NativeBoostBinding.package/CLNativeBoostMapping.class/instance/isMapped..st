testing
isMapped: aNode
	^self mapping at: aNode ifAbsent: [ nil ]