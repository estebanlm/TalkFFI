private type builders
recordVisitorCallback: aRecord
	^ self cursorVisitorClass
		on: [ :cursor :parent :data | 
			| fieldType fieldName crs |
			crs := cursor.
			cursor isTypeRef
				ifTrue: [ crs := cursor referenced ].
			fieldName := crs spelling.
			fieldName ifNotEmpty: [ 
					fieldType := self visitType: crs type.
					builder addField: fieldType -> fieldName toRecord: aRecord ].
			self childVisitContinue ]