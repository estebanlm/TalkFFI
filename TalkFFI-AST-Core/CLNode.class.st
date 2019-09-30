Class {
	#name : #CLNode,
	#superclass : #Object,
	#instVars : [
		'declarationName',
		'sourceLocation'
	],
	#category : 'TalkFFI-AST-Core'
}

{ #category : #'as yet unclassified' }
CLNode class >> createAcceptorMethods [
	[ 
	CLNode withAllSubclasses
		do: [ :class | 
			| acceptString |
			acceptString := 'accept: aVisitor 
		^aVisitor visit' , class name asString , ': self'.
			(RBAddMethodRefactoring addMethod: acceptString toClass: class inProtocols: #visiting) execute ] ]
		on: RBRefactoringError
		do: [ :err | err resumeUnchecked: nil ]
]

{ #category : #'as yet unclassified' }
CLNode class >> createAccessors [
	CLNode withAllSubclasses
		do: [ :each | 
			each instVarNames
				do: [ :var | 
					(RBCreateAccessorsForVariableRefactoring variable: var class: each classVariable: false)
						createGetterAccessor;
						createSetterAccessor;
						execute ] ]
]

{ #category : #'as yet unclassified' }
CLNode class >> createTestingMethods [
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
]

{ #category : #'as yet unclassified' }
CLNode class >> createVisitorClass [
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
]

{ #category : #'as yet unclassified' }
CLNode class >> generateAll [
	"		self generateAll				"
	
	self createAccessors.	
	"visitor"
	self createAcceptorMethods.
	self createVisitorClass.
	"testing"
	self createTestingMethods .
]

{ #category : #'as yet unclassified' }
CLNode class >> named: aName [
	^ self new declarationName: aName
]

{ #category : #visiting }
CLNode >> accept: aVisitor [ 
		^aVisitor visitCLNode: self
]

{ #category : #printing }
CLNode >> clPrintOn: aStream [
	aStream nextPutAll: self declarationName asString
]

{ #category : #accessing }
CLNode >> declarationName [
	^ declarationName
]

{ #category : #accessing }
CLNode >> declarationName: anObject [
	declarationName := anObject
]

{ #category : #testing }
CLNode >> isCLArgument [
	^false
]

{ #category : #testing }
CLNode >> isCLArray [
	^false
]

{ #category : #testing }
CLNode >> isCLEnumeration [
	^false
]

{ #category : #testing }
CLNode >> isCLField [
	^false
]

{ #category : #testing }
CLNode >> isCLFunctionDeclaration [
	^false
]

{ #category : #testing }
CLNode >> isCLFunctionSignature [
	^false
]

{ #category : #testing }
CLNode >> isCLHeaderDeclarations [
	^false
]

{ #category : #testing }
CLNode >> isCLNode [
	^true
]

{ #category : #testing }
CLNode >> isCLOpaque [
	^false
]

{ #category : #testing }
CLNode >> isCLOpaquePtr [
	^false
]

{ #category : #testing }
CLNode >> isCLPointer [
	^false
]

{ #category : #testing }
CLNode >> isCLPrimary [
	^false
]

{ #category : #testing }
CLNode >> isCLStructure [
	^false
]

{ #category : #testing }
CLNode >> isCLType [
	^false
]

{ #category : #testing }
CLNode >> isCLTypeAlias [
	^false
]

{ #category : #testing }
CLNode >> isCLUnion [
	^false
]

{ #category : #testing }
CLNode >> isCLUnsupported [
	^false
]

{ #category : #printing }
CLNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $[.
	self clPrintOn: aStream.
	aStream nextPut: $]
]

{ #category : #accessing }
CLNode >> sourceLocation [
	^ sourceLocation
]

{ #category : #accessing }
CLNode >> sourceLocation: anObject [
	sourceLocation := anObject
]
