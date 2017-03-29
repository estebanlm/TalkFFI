accessing
contextAt: anIndex
	^ context atLast: anIndex ifAbsent: [ nil ]