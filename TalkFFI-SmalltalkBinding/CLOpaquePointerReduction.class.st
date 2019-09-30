Class {
	#name : #CLOpaquePointerReduction,
	#superclass : #CLNodeTraversal,
	#instVars : [
		'opaques'
	],
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #actions }
CLOpaquePointerReduction >> headerDeclarationsExit: aNode [
	| keys values |
	keys := Array new: opaques size.
	values := Array new: opaques size.
	opaques associations
		withIndexDo: [ :a :idx | 
			keys at: idx put: a key.
			values at: idx put: a value ].
	keys elementsForwardIdentityTo: values
]

{ #category : #'initialize-release' }
CLOpaquePointerReduction >> initialize [
	super initialize.
	preventRevisit := false.
	doFunctions := false.
	opaques := IdentityDictionary new.
	
]

{ #category : #private }
CLOpaquePointerReduction >> parentOf: aNode [
	| idx |
	idx := context indexOf: aNode ifAbsent: [ 0 ].
	idx > 1
		ifFalse: [ nil ].
	^ context at: idx - 1
]

{ #category : #private }
CLOpaquePointerReduction >> pointerParent [
	context size - 1 to: 1 by: -1 do: [ :idx | 
		| node |
		node := context at: idx.
		node isCLPointer
			ifTrue: [ ^ node ].
		node isCLTypeAlias
			ifFalse: [ ^ nil ] ].
	^ nil
]

{ #category : #actions }
CLOpaquePointerReduction >> primaryExit: aNode [
	| parent grandParent oPtr   |
	aNode declarationName = #void
		ifFalse: [ ^ self ].
	parent := self pointerParent.
	parent ifNil: [ ^ self ].
	grandParent := self parentOf: parent.
	(grandParent isNil or: [ grandParent isCLTypeAlias not ])
		ifTrue: [ 
			parent pointee isCLTypeAlias
				ifFalse: [ ^ self ].
			oPtr := CLOpaquePtr new
				declarationName: parent pointee declarationName;
				sourceLocation: parent pointee sourceLocation.
			opaques at: parent put: oPtr.
			^ self ].
	oPtr := CLOpaquePtr new
		declarationName: grandParent declarationName;
		sourceLocation: grandParent sourceLocation.
	opaques at: grandParent put: oPtr
]

{ #category : #actions }
CLOpaquePointerReduction >> structureExit: aNode [
	| oPtr parent |
	aNode fields ifNotEmpty: [ ^ self ].
	parent := self pointerParent.
	parent ifNil: [ ^ self ].
	oPtr := CLOpaquePtr new
		declarationName: parent pointee declarationName;
		sourceLocation: parent sourceLocation.
	opaques at: parent put: oPtr
]

{ #category : #actions }
CLOpaquePointerReduction >> unionExit: aNode [
	| oPtr parent |
	aNode fields ifNotEmpty: [ ^ self ].
	parent := self pointerParent.
	parent ifNil: [ ^ self ].
	oPtr := CLOpaquePtr new
		declarationName: parent pointee declarationName;
		sourceLocation: parent sourceLocation.
	opaques at: parent put: oPtr
]

{ #category : #visiting }
CLOpaquePointerReduction >> visitCLStructure: aNode [
	"	overwritten to stop recursivity "
	self node: aNode kind: #structure do: [ ]
]

{ #category : #visiting }
CLOpaquePointerReduction >> visitCLUnion: aNode [
	"	overwritten to stop recursivity "
	self node: aNode kind: #union do: [ ]
]
