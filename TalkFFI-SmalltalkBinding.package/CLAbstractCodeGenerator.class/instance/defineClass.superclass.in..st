compiling classes
defineClass: aClassName superclass: aSuperclassName in: aCategory
	^self rbModel defineClass: ('<1s> subclass: #<2s>
		instanceVariableNames: ''''
		classVariableNames: ''''
		poolDictionaries: ''''
		category: #<3p>' 
			expandMacrosWith: aSuperclassName 
			with: aClassName 
			with: aCategory)