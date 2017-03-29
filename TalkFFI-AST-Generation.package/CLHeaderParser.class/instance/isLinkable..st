testing
isLinkable: aCursor
	| linkageType |
	linkageType := aCursor linkage.
	^ linkageType = CXLinkageKindEnum CXLinkage_UniqueExternal 
		or: [ linkageType = CXLinkageKindEnum CXLinkage_External ]