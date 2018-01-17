as yet unclassified
isActiveOnCflowOf: aPhMethodWrapper
	"inCflowOf ifNil: [^ true].
	^ inCflowOf getPointcuts anySatisfy: [:pc | aCflowStack includes: pc]"

	self pointcut notNil
		ifTrue: [ 
			self composition = #intersection:
				ifTrue: [ ^ true & self pointcut isActiveOnCflowOf: aPhMethodWrapper ] ].
	^ true