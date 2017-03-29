accessing mapping
classFor: aTypeName
	| class |
	(aTypeName asString beginsWith: 'FFI')
		ifTrue: [ ^ nil ].
	class := self typemap at: aTypeName ifAbsent: [ nil ].
	(class notNil and: [ class beginsWith: 'FFI' ])
		ifTrue: [ class := nil ].
	^ class 
		ifNotNil: [ self classNamed: class asSymbol ]
		ifNil: [ self classNamed: aTypeName asSymbol ]