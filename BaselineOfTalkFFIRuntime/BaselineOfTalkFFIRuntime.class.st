Class {
	#name : #BaselineOfTalkFFIRuntime,
	#superclass : #BaselineOf,
	#category : 'BaselineOfTalkFFIRuntime'
}

{ #category : #baselines }
BaselineOfTalkFFIRuntime >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec package: 'TalkFFI-Runtime' ].
]
