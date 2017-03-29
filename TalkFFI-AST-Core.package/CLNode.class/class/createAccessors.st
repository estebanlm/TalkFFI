as yet unclassified
createAccessors
	CLNode withAllSubclasses
		do: [ :each | 
			each instVarNames
				do: [ :var | 
					(RBCreateAccessorsForVariableRefactoring variable: var class: each classVariable: false)
						createGetterAccessor;
						createSetterAccessor;
						execute ] ]