initialize-release
initialize
	super initialize.
	mapping := Dictionary new.
	typemap := Dictionary new.
	uniqueIdx := 0.
	classPrefix := ''.	" no prefix by default"
	generatedClasses := CLGeneratedClasses new.
	model := RBNamespace new.
	ffiSelectorBlock := [:selector | selector].
	isIgnoringUnsupported := false.