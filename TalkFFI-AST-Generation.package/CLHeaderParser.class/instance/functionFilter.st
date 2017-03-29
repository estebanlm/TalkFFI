accessing
functionFilter
	^ functionFilter ifNil: [ functionFilter := self defaultFilterBlock ] ifNotNil: [ functionFilter ]