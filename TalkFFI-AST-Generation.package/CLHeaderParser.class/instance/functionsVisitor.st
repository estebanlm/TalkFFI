private api
functionsVisitor
	^ self cursorVisitorClass
		on: [ :cursor :parent :clientData | 
			(cursor isFunctionDecl and: [ self isLinkable: cursor ])
				ifTrue: [ 
					(self functionFilter value: self headerFile value: cursor)
						ifTrue: [ self functionFromCursor: cursor ] ].
			self childVisitContinue ]