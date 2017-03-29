accessing
types
	"do not return the keys in the types dictionary since the translationUnit was garbage collected after generateFFI call"
	^ types values asSet 