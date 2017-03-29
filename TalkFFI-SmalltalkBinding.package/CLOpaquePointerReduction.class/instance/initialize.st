initialize-release
initialize
	super initialize.
	preventRevisit := false.
	doFunctions := false.
	opaques := IdentityDictionary new.
	