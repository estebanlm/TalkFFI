as yet unclassified
createAcceptorMethods
	[ 
	CLNode withAllSubclasses
		do: [ :class | 
			| acceptString |
			acceptString := 'accept: aVisitor 
		^aVisitor visit' , class name asString , ': self'.
			(RBAddMethodRefactoring addMethod: acceptString toClass: class inProtocols: #visiting) execute ] ]
		on: RBRefactoringError
		do: [ :err | err resumeUnchecked: nil ]