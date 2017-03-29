initialize-release
initialize
	super initialize.
	compilationOptions := OrderedCollection new.
	"by default generate only the functions from the specified headerFile"
	singleFile := true.
	functions := Dictionary new.
	types := Dictionary new.
	unmappable := Set new.

	