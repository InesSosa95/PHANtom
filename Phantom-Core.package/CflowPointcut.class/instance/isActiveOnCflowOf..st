as yet unclassified
isActiveOnCflowOf: aPhMethodWrapper
	| res |
	res := (inCflowOf getActivePointcutsOnCflowOf: aPhMethodWrapper)
		anySatisfy: [ :pc | aPhMethodWrapper getCallStack includes: pc ].
	self selectIfMatch
		ifFalse: [ res := res not ].
	self pointcut notNil
		ifTrue: [ 
			self composition = #intersection:
				ifTrue: [ ^ (res & (self pointcut isActiveOnCflowOf: aPhMethodWrapper)) ]
				ifFalse: [ ^ (res | (self pointcut isActiveOnCflowOf: aPhMethodWrapper)) ] ]
		ifFalse: [
			^ res].