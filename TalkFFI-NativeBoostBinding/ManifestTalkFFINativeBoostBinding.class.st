Class {
	#name : #ManifestTalkFFINativeBoostBinding,
	#superclass : #Object,
	#category : 'TalkFFI-NativeBoostBinding'
}

{ #category : #'meta data' }
ManifestTalkFFINativeBoostBinding class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFINativeBoostBinding class >> rejectRules [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFINativeBoostBinding class >> ruleInconsistentMethodClassificationRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLNativeBoostMapping class' #initialize #true)) #'2013-02-02T20:47:57.633000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFINativeBoostBinding class >> ruleOnlyReadOrWrittenTemporaryRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLNativeBoostMapping #visitCLUnion: #false)) #'2013-02-02T20:16:23.338+01:00') #(#(#RGMethodDefinition #(#CLNativeBoostMapping #visitCLOpaquePtr: #false)) #'2013-02-02T20:16:32.072+01:00') #(#(#RGMethodDefinition #(#CLNativeBoostMapping #visitCLStructure: #false)) #'2013-02-02T20:16:39.613+01:00') #(#(#RGMethodDefinition #(#CLNativeBoostMapping #visitCLHeaderDeclarations: #false)) #'2013-02-02T20:17:24.613+01:00') #(#(#RGMethodDefinition #(#CLNativeBoostMapping #visitCLField: #false)) #'2013-02-02T20:17:33.069+01:00') #(#(#RGMethodDefinition #(#CLNativeBoostMapping #visitCLEnumeration: #false)) #'2013-02-02T20:17:39.092+01:00') #(#(#RGMethodDefinition #(#CLNativeBoostMapping #visitCLFunctionDeclaration: #false)) #'2013-02-02T20:17:48.336+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFINativeBoostBinding class >> ruleSentNotImplementedRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLNativeBoostMapping #openChanges #false)) #'2013-02-02T20:09:54.24+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFINativeBoostBinding class >> ruleUnclassifiedMethodsRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLNativeBoostMapping class' #initialize #true)) #'2013-02-02T21:02:19.724000001+01:00') )
]
