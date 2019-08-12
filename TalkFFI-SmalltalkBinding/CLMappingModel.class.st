Class {
	#name : #CLMappingModel,
	#superclass : #Object,
	#instVars : [
		'libraryName',
		'mapping',
		'model',
		'typemap',
		'uniqueIdx',
		'category',
		'generatedClasses',
		'ffiSelectorBlock',
		'classPrefix',
		'isIgnoringUnsupported',
		'libraryPath',
		'functionFilter'
	],
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #accessing }
CLMappingModel >> bindingCategory [ 	
	^self category, '-Binding'
]

{ #category : #accessing }
CLMappingModel >> category [
	^ category ifNil: [ category := self libraryName , '-FFI' ] ifNotNil: [ category ]
]

{ #category : #accessing }
CLMappingModel >> category: anObject [
	category := anObject
]

{ #category : #accessing }
CLMappingModel >> classPrefix [
	^ classPrefix
]

{ #category : #accessing }
CLMappingModel >> classPrefix: anObject [
	classPrefix := anObject
]

{ #category : #accessing }
CLMappingModel >> ffiSelectorBlock [
	^ ffiSelectorBlock
]

{ #category : #accessing }
CLMappingModel >> ffiSelectorBlock: anObject [
	ffiSelectorBlock := anObject
]

{ #category : #accessing }
CLMappingModel >> functionFilter [
	^ functionFilter
]

{ #category : #accessing }
CLMappingModel >> functionFilter: anObject [
	functionFilter := anObject
]

{ #category : #accessing }
CLMappingModel >> generatedClasses [
	^ generatedClasses
]

{ #category : #accessing }
CLMappingModel >> generatedClasses: anObject [
	generatedClasses := anObject
]

{ #category : #accessing }
CLMappingModel >> ignoreUnsupported [
	isIgnoringUnsupported := true.
]

{ #category : #'initialize-release' }
CLMappingModel >> initialize [
	super initialize.
	mapping := Dictionary new.
	typemap := Dictionary new.
	uniqueIdx := 0.
	classPrefix := ''.	" no prefix by default"
	generatedClasses := CLGeneratedClasses new.
	model := RBNamespace new.
	ffiSelectorBlock := [:selector | selector].
	isIgnoringUnsupported := false.
]

{ #category : #accessing }
CLMappingModel >> isIgnoringUnsupported [
	^isIgnoringUnsupported 
]

{ #category : #accessing }
CLMappingModel >> libraryName [
	^ libraryName
]

{ #category : #accessing }
CLMappingModel >> libraryName: anObject [
	libraryName := anObject
]

{ #category : #accessing }
CLMappingModel >> libraryPath [
	^ libraryPath
]

{ #category : #accessing }
CLMappingModel >> libraryPath: anObject [
	libraryPath := anObject
]

{ #category : #accessing }
CLMappingModel >> mapping [
	^ mapping
]

{ #category : #accessing }
CLMappingModel >> mapping: anObject [
	mapping := anObject
]

{ #category : #accessing }
CLMappingModel >> model [
	^ model
]

{ #category : #accessing }
CLMappingModel >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CLMappingModel >> typemap [
	^ typemap
]

{ #category : #accessing }
CLMappingModel >> typemap: anObject [
	typemap := anObject
]

{ #category : #accessing }
CLMappingModel >> typemapClassName [
	^ (self libraryName , 'Library') asSymbol
]

{ #category : #accessing }
CLMappingModel >> typesCategory [ 	
	^self category, '-Types'
]

{ #category : #accessing }
CLMappingModel >> uniqueIdx [
	^ uniqueIdx := uniqueIdx + 1.
]

{ #category : #accessing }
CLMappingModel >> uniqueIdx: anObject [
	uniqueIdx := anObject
]
