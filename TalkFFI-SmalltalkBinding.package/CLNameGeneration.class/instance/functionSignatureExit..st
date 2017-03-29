actions
functionSignatureExit: aNode
	aNode function ifNil: [ self node: aNode suffix: 'Cb' ]