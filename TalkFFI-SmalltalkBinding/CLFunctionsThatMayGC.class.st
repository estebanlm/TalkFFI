Class {
	#name : #CLFunctionsThatMayGC,
	#superclass : #CLNodeVisitor,
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLArgument: aNode [
	^ aNode type accept: self
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLArray: aNode [
	^false
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLEnumeration: aNode [
	^false
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLFunctionDeclaration: aNode [
	^ aNode declarationName
		-> (((aNode signature arguments collect: [ :each | each accept: self ]) select: [ :e | e ]) notEmpty)
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLFunctionSignature: aNode [
	^true
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLHeaderDeclarations: aNode [
	^(aNode functions values collect: [ :each | each last accept: self ]) asDictionary 
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLOpaquePtr: aNode [
	^ false
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLPointer: aNode [
	^aNode pointee accept: self
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLPrimary: aNode [
	^ false
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLStructure: aNode [
	^false
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLTypeAlias: aNode [
	^aNode canonicalType accept: self
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLUnion: aNode [
	^false
]

{ #category : #visiting }
CLFunctionsThatMayGC >> visitCLUnsupported: aNode [
	^false
]
