Class {
	#name : #ManifestTalkFFIExamples,
	#superclass : #Object,
	#category : 'TalkFFI-Examples'
}

{ #category : #'meta data' }
ManifestTalkFFIExamples class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIExamples class >> rejectRules [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIExamples class >> ruleClassNotReferencedRuleV1FalsePositive [
^ #(#(#(#RGClassDefinition #(#TalkFFIExamples)) #'2013-02-02T20:59:20.189000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIExamples class >> ruleImplementedNotSentRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#'TalkFFIExamples class' #cairoMapping #true)) #'2013-02-02T20:57:14.795000001+01:00') #(#(#RGMethodDefinition #(#'TalkFFIExamples class' #llvmc31Mapping #true)) #'2013-02-02T20:57:17.031+01:00') #(#(#RGMethodDefinition #(#'TalkFFIExamples class' #libClang31Mapping #true)) #'2013-02-02T20:57:20.789+01:00') #(#(#RGMethodDefinition #(#'TalkFFIExamples class' #vecLibMapping #true)) #'2013-02-02T20:57:23.001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIExamples class >> ruleOnlyReadOrWrittenTemporaryRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'TalkFFIExamples class' #libgit2Mapping #true)) #'2013-02-02T20:18:02.756+01:00') )
]
