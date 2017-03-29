as yet unclassified
createVisitorClass
	"			self createVisitorClass 			"

	| visitor |
	Smalltalk
		at: #CLNodeVisitor
		ifAbsent: [ 
			(RBAddClassRefactoring
				addClass: #CLNodeVisitor
				superclass: Object
				subclasses: {}
				category: #'Clang-FFI-AST-Core') execute ].
	visitor := Smalltalk at: #CLNodeVisitor.
	self withAllSubclasses
		do: [ :class | 
			| visitString |
			visitString := 'visit' , class name asString
				,
					': aNode 
		^self subclassResponsibility'.
			[ (RBAddMethodRefactoring addMethod: visitString toClass: visitor inProtocols: #visiting) execute ]
				on: RBRefactoringError
				do: [ :err | err resumeUnchecked: nil ] ]