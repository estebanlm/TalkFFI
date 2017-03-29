as yet unclassified
createTestingMethods
	[ 
	CLNode withAllSubclasses
		do: [ :class | 
			| testString abstractString |
			abstractString := 'is<1s>
	^false' expandMacrosWith: class name asString.
			(RBAddMethodRefactoring addMethod: abstractString toClass: CLNode inProtocols: #testing) execute.
			testString := 'is<1s>
	^true' expandMacrosWith: class name asString.
			(RBAddMethodRefactoring addMethod: testString toClass: class inProtocols: #testing) execute ] ]
		on: RBRefactoringError
		do: [ :err | err resumeUnchecked: nil ]