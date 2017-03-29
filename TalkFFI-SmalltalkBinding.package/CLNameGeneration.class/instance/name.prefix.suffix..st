private
name: aName prefix: aPrefix suffix: aSuffix
	| name |
	name := (aName isNil or: [ aName = '' ])
		ifTrue: [ defaultName, self uniqueIdx printString ]
		ifFalse: [ self camelFromString: (aName asString copyReplaceAll: '*' with: 'Ptr') ].
	name := (name beginsWith: aPrefix)
		ifTrue: [ name ]
		ifFalse: [ aPrefix, name ].
	^ (name , aSuffix) asSymbol