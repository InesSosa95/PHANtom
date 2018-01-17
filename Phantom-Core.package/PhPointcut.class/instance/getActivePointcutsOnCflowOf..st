accessing
getActivePointcutsOnCflowOf: aPhMethodWrapper
	| pointcuts |
	(self isActiveOnCflowOf: aPhMethodWrapper)
		ifFalse: [ pointcuts := #()]
		ifTrue: [pointcuts := self createPointcutList.].
	(self pointcut notNil) ifTrue: [
		pointcuts := pointcuts perform: (self composition) with: (self pointcut getActivePointcutsOnCflowOf: aPhMethodWrapper)  ].
	^pointcuts