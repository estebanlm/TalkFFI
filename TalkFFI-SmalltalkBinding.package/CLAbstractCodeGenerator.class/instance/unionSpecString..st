string generation
unionSpecString: fields
	^ 'fieldsDesc<n><t>^#(<1s><n><t>)' expandMacrosWith: (self fieldsString: fields)