accessing mapping
metaclassFor: aTypeName
	| class |
	(aTypeName asString beginsWith: 'FFI')
		ifTrue: [ ^ nil ].
	class := self typemap at: aTypeName ifAbsent: [ nil ].
	(class notNil and: [ class beginsWith: 'FFI' ])
		ifTrue: [ class := nil ].
	^ class 
		ifNotNil: [ self metaclassNamed: class asSymbol ]
		ifNil: [ self metaclassNamed:  aTypeName asSymbol ]