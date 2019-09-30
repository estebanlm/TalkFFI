Class {
	#name : #CLNodeTraversal,
	#superclass : #CLNodeVisitor,
	#instVars : [
		'visited',
		'context',
		'preventRevisit',
		'doTypes',
		'doFunctions'
	],
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #actions }
CLNodeTraversal >> argumentEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> argumentExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> arrayEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> arrayExit: aNode [
]

{ #category : #accessing }
CLNodeTraversal >> contextAt: anIndex [
	^ context atLast: anIndex ifAbsent: [ nil ]
]

{ #category : #actions }
CLNodeTraversal >> enumerationEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> enumerationExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> fieldEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> fieldExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> functionDeclarationEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> functionDeclarationExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> functionSignatureEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> functionSignatureExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> headerDeclarationsEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> headerDeclarationsExit: aNode [
]

{ #category : #'initialize-release' }
CLNodeTraversal >> initialize [
	super initialize.
	visited := IdentityDictionary new.
	context := OrderedCollection new.
	preventRevisit := true.
	doTypes := true.
	doFunctions := true
]

{ #category : #accessing }
CLNodeTraversal >> myContext [
	^ context last
]

{ #category : #helpers }
CLNodeTraversal >> node: aNode kind: aSymbol do: aBlock [
	| wasVisited |
	preventRevisit
		ifTrue: [ 
			wasVisited := visited at: aNode ifAbsent: [ false ].
			wasVisited
				ifTrue: [ ^ self ].
			visited at: aNode put: true ].
	context add: aNode.
	self perform: (aSymbol asString , 'Enter:') asSymbol with: aNode.
	aBlock cull: aNode.
	self perform: (aSymbol asString , 'Exit:') asSymbol with: aNode.
	context removeLast
]

{ #category : #actions }
CLNodeTraversal >> opaquePtrEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> opaquePtrExit: aNode [
]

{ #category : #accessing }
CLNodeTraversal >> parentContext [
	^ context atLast: 2 ifAbsent: [ nil ]
]

{ #category : #actions }
CLNodeTraversal >> pointerEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> pointerExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> primaryEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> primaryExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> structureEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> structureExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> typeAliasEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> typeAliasExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> unionEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> unionExit: aNode [
]

{ #category : #actions }
CLNodeTraversal >> unsupportedEnter: aNode [
]

{ #category : #actions }
CLNodeTraversal >> unsupportedExit: aNode [
]

{ #category : #helpers }
CLNodeTraversal >> unvisit: aNode [
	visited at: aNode put: false
]

{ #category : #visiting }
CLNodeTraversal >> visitCLArgument: aNode [
	self node: aNode kind: #argument do: [ aNode type accept: self ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLArray: aNode [
	self node: aNode kind: #array do: [ aNode elementType accept: self ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLEnumeration: aNode [
	self node: aNode kind: #enumeration do: [ aNode type accept: self ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLField: aNode [
	self node: aNode kind: #field do: [ aNode type accept: self ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLFunctionDeclaration: aNode [
	self node: aNode kind: #functionDeclaration do: [ aNode signature accept: self ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLFunctionSignature: aNode [
	self
		node: aNode
		kind: #functionSignature
		do: [ 
			aNode returnType accept: self.
			aNode arguments do: [ :arg | arg accept: self ] ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLHeaderDeclarations: aNode [
	self
		node: aNode
		kind: #headerDeclarations
		do: [ 
			doTypes
				ifTrue: [ aNode types do: [ :type | type accept: self ] ].
			doFunctions
				ifTrue: [ aNode functions values do: [ :fct | fct last accept: self ] ] ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLOpaquePtr: aNode [
	self node: aNode kind: #opaquePtr do: [  ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLPointer: aNode [
	self node: aNode kind: #pointer do: [ aNode pointee accept: self ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLPrimary: aNode [
	self node: aNode kind: #primary do: [  ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLStructure: aNode [
	self node: aNode kind: #structure do: [ aNode fields do: [ :field | field accept: self ] ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLTypeAlias: aNode [
	self node: aNode kind: #typeAlias do: [ aNode canonicalType accept: self ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLUnion: aNode [
	self node: aNode kind: #union do: [ aNode fields do: [ :field | field accept: self ] ]
]

{ #category : #visiting }
CLNodeTraversal >> visitCLUnsupported: aNode [
	self node: aNode kind: #unsupported do: [  ]
]
