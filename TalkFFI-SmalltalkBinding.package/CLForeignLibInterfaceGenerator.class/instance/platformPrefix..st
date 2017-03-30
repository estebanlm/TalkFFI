private
platformPrefix: platform
	self flag: #todo. "This will change for 64bits"
	platform isMacOS ifTrue: [ ^ 'mac' ].
	platform isUnix32 ifTrue: [ ^ 'unix' ].
	platform isWin32 ifTrue: [ ^ 'win32' ].
	
	self error: ('Undefined platform: {1}' format: { platform asString })