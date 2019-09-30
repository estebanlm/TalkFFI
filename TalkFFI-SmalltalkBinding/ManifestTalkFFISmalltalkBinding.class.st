Class {
	#name : #ManifestTalkFFISmalltalkBinding,
	#superclass : #Object,
	#category : 'TalkFFI-SmalltalkBinding'
}

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> rejectRules [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleConsistencyCheckRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLNameGeneration #camelFromString: #false)) #'2013-02-02T20:31:13.211+01:00') #(#(#RGMethodDefinition #(#CLFunctionsThatMayGC #visitCLFunctionDeclaration: #false)) #'2013-02-02T20:32:51.173+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleImplementedNotSentRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#CLOpaquePointerReduction #headerDeclarationsExit: #false)) #'2013-02-02T20:55:08.849000001+01:00') #(#(#RGMethodDefinition #(#CLOpaquePointerReduction #structureExit: #false)) #'2013-02-02T20:55:11.333+01:00') #(#(#RGMethodDefinition #(#CLForeignLibInterfaceGenerator #implement #false)) #'2013-02-02T20:55:55.394+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #functionSignatureExit: #false)) #'2013-02-02T20:56:16.021+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #typeAliasExit: #false)) #'2013-02-02T20:56:21.694+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #headerDeclarationsExit: #false)) #'2013-02-02T20:56:24.511+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #arrayExit: #false)) #'2013-02-02T20:56:27.046+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #enumerationExit: #false)) #'2013-02-02T20:56:29.299+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #structureExit: #false)) #'2013-02-02T20:56:31.617+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #unionExit: #false)) #'2013-02-02T20:56:34.067+01:00') #(#(#RGMethodDefinition #(#CLNameGeneration #opaquePtrExit: #false)) #'2013-02-02T20:56:36.787+01:00') #(#(#RGMethodDefinition #(#CLNodeTraversal #structureEnter: #false)) #'2013-02-02T20:59:52.61+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleInconsistentMethodClassificationRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLAbstractCodeGenerator #initialize #false)) #'2013-02-02T20:46:52.176+01:00') #(#(#RGMethodDefinition #(#CLGeneratedClasses #initialize #false)) #'2013-02-02T20:53:27.972+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleLawOfDemeterRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLNameGeneration #camelFromString: #false)) #'2013-02-02T20:33:53.468+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleNotEliminationRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLFunctionsThatMayGC #visitCLFunctionDeclaration: #false)) #'2013-02-02T20:12:28.634+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleOnlyReadOrWrittenTemporaryRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLAbstractCodeGenerator #selectorString: #false)) #'2013-02-02T20:18:21.133+01:00') #(#(#RGMethodDefinition #(#CLAbstractCodeGenerator #enumSpecString: #false)) #'2013-02-02T20:18:27.048+01:00') #(#(#RGMethodDefinition #(#CLAbstractCodeGenerator #compileFnCall:signature:in: #false)) #'2013-02-02T20:18:37.902+01:00') #(#(#RGMethodDefinition #(#CLForeignLibInterfaceGenerator #generate #false)) #'2013-02-02T20:18:49.984+01:00') #(#(#RGMethodDefinition #(#CLOpaquePointerReduction #primaryExit: #false)) #'2013-02-02T20:19:01.998+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleOnlyReadOrWrittenVariableRuleV1TruePositive [
^ #(#(#(#RGClassDefinition #(#CLForeignLibInterfaceGenerator)) #'2013-02-02T20:14:39.41+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleUnclassifiedMethodsRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLGeneratedClasses #initialize #false)) #'2013-02-02T21:02:20.300000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleUndeclaredReferenceRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLForeignLibInterfaceGenerator #platform:libPath: #false)) #'2013-02-02T20:43:38.926000011+01:00') #(#(#RGMethodDefinition #(#CLForeignLibInterfaceGenerator #initialize #false)) #'2013-02-02T20:43:38.976000001+01:00') #(#(#RGMethodDefinition #(#CLForeignLibInterfaceGenerator #libraryHandleMethodString #false)) #'2013-02-02T20:43:39.023000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFISmalltalkBinding class >> ruleUnreferencedVariablesRuleV1TruePositive [
^ #(#(#(#RGClassDefinition #(#CLForeignLibInterfaceGenerator)) #'2013-02-02T20:33:58.161+01:00') )
]
