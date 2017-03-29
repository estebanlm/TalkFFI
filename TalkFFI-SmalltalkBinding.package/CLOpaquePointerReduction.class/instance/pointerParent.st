private
pointerParent
	context size - 1 to: 1 by: -1 do: [ :idx | 
		| node |
		node := context at: idx.
		node isCLPointer
			ifTrue: [ ^ node ].
		node isCLTypeAlias
			ifFalse: [ ^ nil ] ].
	^ nil