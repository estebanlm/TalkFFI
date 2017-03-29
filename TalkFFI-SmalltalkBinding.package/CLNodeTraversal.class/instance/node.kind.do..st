helpers
node: aNode kind: aSymbol do: aBlock
	| wasVisited |
	preventRevisit
		ifTrue: [ 
			wasVisited := visited at: aNode ifAbsent: [ false ].
			wasVisited
				ifTrue: [ ^ self ].
			visited at: aNode put: true ].
	context add: aNode.
	self perform: (aSymbol asString , 'Enter:') asSymbol with: aNode.
	aBlock cull: aNode.
	self perform: (aSymbol asString , 'Exit:') asSymbol with: aNode.
	context removeLast