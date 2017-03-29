example-buddy
buddySelectorTrimmer
	^ [ :selector | 
	(selector beginsWith: 'bdd')
		ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
		ifFalse: [ 
			(selector beginsWith: 'fdd')
				ifTrue: [ (selector copyFrom: 5 to: selector size) uncapitalized ]
				ifFalse: [ 
					(selector beginsWith: 'bvec')
						ifTrue: [ (selector copyFrom: 6 to: selector size) uncapitalized ]
						ifFalse: [ selector uncapitalized ] ] ] ]