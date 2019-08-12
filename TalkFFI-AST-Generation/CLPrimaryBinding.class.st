Class {
	#name : #CLPrimaryBinding,
	#superclass : #SharedPool,
	#classVars : [
		'bool',
		'char16',
		'char32',
		'char_s',
		'char_u',
		'double',
		'firstbuiltin',
		'float',
		'int',
		'int128',
		'long',
		'longdouble',
		'longlong',
		'schar',
		'short',
		'uchar',
		'uint',
		'uint128',
		'ulong',
		'ulonglong',
		'ushort',
		'void',
		'wchar'
	],
	#category : 'TalkFFI-AST-Generation'
}

{ #category : #accessing }
CLPrimaryBinding class >> at: anItem [
	^ self classPool at: anItem ifAbsent: [ nil ]
]

{ #category : #'class initialization' }
CLPrimaryBinding class >> initialize [
	self classPool: self initializeBinding
]

{ #category : #'class initialization' }
CLPrimaryBinding class >> initializeBinding [
	| binding eDecl|
	eDecl :=  self typeKindClass enumDecl.
	binding := Dictionary new.
	
	5 to: (eDecl indexOf: #CXType_LongDouble) by: 2 do:[:idx |
		|item|
		item := (eDecl at: idx).
		self primaryNamed: (item copyFrom: 8 to: item size) asLowercase asSymbol in: binding
		].
	binding at: #firstbuiltin put: (binding at: #void).
	^ binding
]

{ #category : #private }
CLPrimaryBinding class >> primaryNamed: aName in: aBinding [
	aBinding at: aName put: (CLPrimary new declarationName: aName)
]

{ #category : #accessing }
CLPrimaryBinding class >> typeKindClass [
	^CXTypeKindEnum 
]
