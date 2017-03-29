initialize-release
initialize
	super initialize.
	visited := IdentityDictionary new.
	context := OrderedCollection new.
	preventRevisit := true.
	doTypes := true.
	doFunctions := true