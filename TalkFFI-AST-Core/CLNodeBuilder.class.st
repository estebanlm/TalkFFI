Class {
	#name : #CLNodeBuilder,
	#superclass : #Object,
	#category : 'TalkFFI-AST-Core'
}

{ #category : #'node building' }
CLNodeBuilder >> addField: anAssociation toRecord: aStructDecl [
	aStructDecl
		add:
			(CLField new
				declarationName: anAssociation value;
				type: anAssociation key)
]

{ #category : #'node building' }
CLNodeBuilder >> aliasNamed: aName of: aCLType sourceLocation: aLocation [
	^ CLTypeAlias new
		declarationName: aName;
		canonicalType: aCLType;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> argumentNamed: aName type: aCLType sourceLocation: aLocation [
	^ CLArgument new
		declarationName: aName;
		type: aCLType;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> arguments: argList returnType: aCLType sourceLocation: aLocation [
	^ CLFunctionSignature new
		arguments: argList;
		returnType: aCLType;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> arrayNamed: aName elementType: aCLType size: aNumber sourceLocation: aSourceLocation [
	^ CLArray new
		declarationName: aName;
		elementType: aCLType;
		numElements: aNumber;
		sourceLocation: aSourceLocation
]

{ #category : #'node building' }
CLNodeBuilder >> enum: anEnum at: anItem put: aValue [

	anEnum at: anItem put: aValue 
]

{ #category : #'node building' }
CLNodeBuilder >> enumNamed: aName type: aCLType sourceLocation: aLocation [
	^ CLEnumeration new
		declarationName: aName;
		type: aCLType;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> functionNamed: aName signature: aCLFunctionSignature sourceLocation: aLocation [
	^ CLFunctionDeclaration new
		declarationName: aName;
		signature: aCLFunctionSignature;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> headerNamed: aName types: someTypes functions: someFunctions unmappable: someUnmappableTypes sourceLocation: aLocation [
	^ CLHeaderDeclarations new
		declarationName: aName;
		types: someTypes;
		functions: someFunctions;
		unmappable: someUnmappableTypes;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> pointerTo: aPointee sourceLocation: aLocation [
	^ CLPointer new
		pointee: aPointee;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> primaryNamed: aName [
	^ CLPrimary named: aName
]

{ #category : #'node building' }
CLNodeBuilder >> primaryNamed: aName using: aTypeToPrimaryBinding [
	^ aTypeToPrimaryBinding at: aName
]

{ #category : #'node building' }
CLNodeBuilder >> structNamed: aName sourceLocation: aLocation [
	^ CLStructure new
		declarationName: aName;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> unionNamed: aName sourceLocation: aLocation [
	^ CLUnion new
		declarationName: aName;
		sourceLocation: aLocation
]

{ #category : #'node building' }
CLNodeBuilder >> unsupportedNamed: aName type: aTypeKind sourceLocation: aSrcLoc [
	^ CLUnsupported new
		declarationName: aName;
		type: aTypeKind;
		sourceLocation: aSrcLoc
]
