visiting
visitCLUnsupported: aNode
	| node |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	self mappingModel isIgnoringUnsupported 
		ifFalse: [ self notify: 'Unsupported definition ' , aNode printString , ' found' ].
	^ self mapping at: aNode put: '"unsupported"'