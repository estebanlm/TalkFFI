private
parentOf: aNode
	| idx |
	idx := context indexOf: aNode ifAbsent: [ 0 ].
	idx > 1
		ifFalse: [ nil ].
	^ context at: idx - 1