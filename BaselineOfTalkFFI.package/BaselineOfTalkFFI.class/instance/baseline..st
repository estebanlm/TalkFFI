baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec 
			baseline: 'LibClang' with: [
				spec repository: 'github://estebanlm/libclang-pharo-bindings' ].
		spec 
			package: 'TalkFFI-Runtime';
			package: 'TalkFFI-Announcements';
			package: 'TalkFFI-AST-Core';
			package: 'TalkFFI-AST-Generation' with: [
				spec requires: #('LibClang' 'TalkFFI-AST-Core' );
				postLoadDoIt: #postloadForASTGeneration ];
			package: 'TalkFFI-SmalltalkBinding' with: [
				spec requires: #('TalkFFI-AST-Core' ). ];
			package: 'TalkFFI-NativeBoostBinding' with: [
				spec requires: #('TalkFFI-SmalltalkBinding' ). ];
			package: 'TalkFFI-Examples' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')];
			package: 'TalkFFI-Tests' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')] ].
