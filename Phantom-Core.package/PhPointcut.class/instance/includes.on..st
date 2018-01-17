accessing
includes: aSelector on: aClass
	| includes |
	includes := self localIncludes: aSelector on: aClass.
	self pointcut
		ifNil: [ ^ includes ]
		ifNotNil: [ 
			self composition = #intersection:
				ifTrue: [ ^ includes & (pointcut localIncludes: aSelector on: aClass) ]
				ifFalse: [ ^ includes | (pointcut localIncludes: aSelector on: aClass) ] ]