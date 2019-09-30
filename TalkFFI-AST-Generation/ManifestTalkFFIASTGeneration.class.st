Class {
	#name : #ManifestTalkFFIASTGeneration,
	#superclass : #Object,
	#category : 'TalkFFI-AST-Generation'
}

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> rejectRules [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleClassVariableCapitalizationRuleV1FalsePositive [
^ #(#(#(#RGClassDefinition #(#CLPrimaryBinding)) #'2013-02-02T20:33:04.546+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleConsistencyCheckRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLHeaderParser #typeName: #false)) #'2013-02-02T20:31:52.698+01:00') #(#(#RGMethodDefinition #(#CLHeaderParser #recordVisitorCallback: #false)) #'2013-02-02T20:32:26.413+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleExcessiveVariablesRuleV1FalsePositive [
^ #(#(#(#RGClassDefinition #(#CLPrimaryBinding)) #'2013-02-02T20:53:44.520000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleInconsistentMethodClassificationRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLHeaderParser class' #new #true)) #'2013-02-02T20:50:25.434+01:00') #(#(#RGMethodDefinition #(#'CLPrimaryBinding class' #at: #true)) #'2013-02-02T20:53:14.148+01:00') #(#(#RGMethodDefinition #(#'CLPrimaryBinding class' #initialize #true)) #'2013-02-02T20:53:14.196+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleSendsUnknownMessageToGlobalRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#CLHeaderParser #isLinkable: #false)) #'2013-02-02T20:10:24.438+01:00') #(#(#RGMethodDefinition #(#CLHeaderParser #childVisitContinue #false)) #'2013-02-02T20:10:29.777+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleSentNotImplementedRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#CLHeaderParser #childVisitContinue #false)) #'2013-02-02T20:09:11.106+01:00') #(#(#RGMethodDefinition #(#CLHeaderParser #isLinkable: #false)) #'2013-02-02T20:09:28.418+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleUnclassifiedMethodsRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLPrimaryBinding class' #primaryNamed:in: #true)) #'2013-02-02T21:02:19.167000001+01:00') #(#(#RGMethodDefinition #(#'CLHeaderParser class' #builder: #true)) #'2013-02-02T21:02:19.432000001+01:00') #(#(#RGMethodDefinition #(#'CLPrimaryBinding class' #at: #true)) #'2013-02-02T21:02:19.469000001+01:00') #(#(#RGMethodDefinition #(#'CLPrimaryBinding class' #initializeBinding #true)) #'2013-02-02T21:02:19.508+01:00') #(#(#RGMethodDefinition #(#'CLHeaderParser class' #new #true)) #'2013-02-02T21:02:19.760000001+01:00') #(#(#RGMethodDefinition #(#'CLPrimaryBinding class' #initialize #true)) #'2013-02-02T21:02:20.157000001+01:00') #(#(#RGMethodDefinition #(#'CLPrimaryBinding class' #typeKindClass #true)) #'2013-02-02T21:02:20.448000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTGeneration class >> ruleUncommonMessageSendRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#CLHeaderParser #isLinkable: #false)) #'2013-02-02T20:21:13.865+01:00') #(#(#RGMethodDefinition #(#CLHeaderParser #childVisitContinue #false)) #'2013-02-02T20:21:17.121+01:00') )
]
