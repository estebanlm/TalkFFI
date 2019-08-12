Class {
	#name : #CLNativeBoostMappingFctInObjects,
	#superclass : #CLNativeBoostMappingFlatArray,
	#category : 'TalkFFI-NativeBoostBinding'
}

{ #category : #'accessing mapping' }
CLNativeBoostMappingFctInObjects >> classFor: aTypeName [
	| class |
	(aTypeName asString beginsWith: 'FFI')
		ifTrue: [ ^ nil ].
	class := self typemap at: aTypeName ifAbsent: [ nil ].
	(class notNil and: [ class beginsWith: 'FFI' ])
		ifTrue: [ class := nil ].
	^ class 
		ifNotNil: [ self classNamed: class asSymbol ]
		ifNil: [ self classNamed: aTypeName asSymbol ]
]

{ #category : #compiling }
CLNativeBoostMappingFctInObjects >> compileExternalTypeAlias: aClassName [
	self
		compile: ('externalTypeAlias: aTypeName<n><t>^ <1s><n><t><t>typeAt: aTypeName<n><t><t>ifAbsent:[ aTypeName ]' expandMacrosWith: self mappingModel typemapClassName)
		in: (self metaclassNamed: aClassName)
		classified: 'ffi types'
]

{ #category : #'compiling classes' }
CLNativeBoostMappingFctInObjects >> defineCallbackClass: aName [
	|ret|
	ret := super defineCallbackClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret
]

{ #category : #'compiling classes' }
CLNativeBoostMappingFctInObjects >> defineEnumClass: aName [
	|ret|
	ret := super defineEnumClass: aName.
	self compileNbBindingOf: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret
]

{ #category : #'compiling classes' }
CLNativeBoostMappingFctInObjects >> defineOpaqueClass: aName [
	|ret|
	ret := super defineOpaqueClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret
]

{ #category : #'compiling classes' }
CLNativeBoostMappingFctInObjects >> defineStructClass: aName [
	|ret|
	ret := super defineStructClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret
]

{ #category : #'compiling classes' }
CLNativeBoostMappingFctInObjects >> defineUnionClass: aName [
	|ret|
	ret := super defineUnionClass: aName.
	self compileFFILibraryName: aName.
	self compileExternalTypeAlias: aName.
	^ret
]

{ #category : #'accessing mapping' }
CLNativeBoostMappingFctInObjects >> metaclassFor: aTypeName [
	| class |
	(aTypeName asString beginsWith: 'FFI')
		ifTrue: [ ^ nil ].
	class := self typemap at: aTypeName ifAbsent: [ nil ].
	(class notNil and: [ class beginsWith: 'FFI' ])
		ifTrue: [ class := nil ].
	^ class 
		ifNotNil: [ self metaclassNamed: class asSymbol ]
		ifNil: [ self metaclassNamed:  aTypeName asSymbol ]
]

{ #category : #visiting }
CLNativeBoostMappingFctInObjects >> visitCLFunctionDeclaration: aNode [
	| node signature compObj compClass defaultBlock |
	(node := self isMapped: aNode) ifNotNil: [ ^ node ].
	self checkAvailability: aNode declarationName.
	signature := aNode signature accept: self.
	defaultBlock := [ self compileFnCall: aNode declarationName signature: signature in: (self classNamed: headerClass) ].	
	"get the type of the first argument"
	signature last ifNotEmpty: [ compObj := self classFor: signature last first key ].
	^ compObj
		ifNil: [ 
			compClass := self metaclassFor: signature first.
			compClass
				ifNil: [ defaultBlock value ]
				ifNotNil: [ self compileFnCall: aNode declarationName signature: signature in: compClass ] ]
		ifNotNil: [ 
			signature := signature deepCopy.
			signature last at: 1 put: 'self'.
			self compileFnCall: aNode declarationName signature: signature in: compObj ]
]
