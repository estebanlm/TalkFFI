Class {
	#name : #CLNodeVisitor,
	#superclass : #Object,
	#category : 'TalkFFI-AST-Core'
}

{ #category : #visiting }
CLNodeVisitor >> visitCLArgument: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLArray: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLEnumeration: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLField: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLFunctionDeclaration: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLFunctionSignature: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLHeaderDeclarations: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLNode: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLOpaque: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLOpaquePtr: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLPointer: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLPrimary: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLStructure: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLType: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLTypeAlias: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLUnion: aNode [ 
		^self subclassResponsibility
]

{ #category : #visiting }
CLNodeVisitor >> visitCLUnsupported: aNode [ 
		^self subclassResponsibility
]
