"
This is the entry point of the TalkFFI mapping to nativeboost. See class-side examples for usage scenarios
"
Class {
	#name : #CLForeign2NBGenerator,
	#superclass : #CLForeignLibInterfaceGenerator,
	#instVars : [
		'codeGenerationVisitor'
	],
	#category : 'TalkFFI-NativeBoostBinding'
}

{ #category : #accessing }
CLForeign2NBGenerator >> codeGenerationVisitor [
	^ codeGenerationVisitor 
]

{ #category : #accessing }
CLForeign2NBGenerator >> codeGenerationVisitor: aCGV [
	codeGenerationVisitor := aCGV 
]

{ #category : #initialization }
CLForeign2NBGenerator >> initialize [ 
	super initialize .
	codeGenerationVisitor := CLNativeBoostMappingFlatArray.
]
