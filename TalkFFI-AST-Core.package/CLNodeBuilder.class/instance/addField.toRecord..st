node building
addField: anAssociation toRecord: aStructDecl
	aStructDecl
		add:
			(CLField new
				declarationName: anAssociation value;
				type: anAssociation key)