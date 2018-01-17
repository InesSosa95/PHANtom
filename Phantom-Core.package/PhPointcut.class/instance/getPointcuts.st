accessing
getPointcuts
	| pointcuts |
	pointcuts := self createPointcutList.
	(self pointcut notNil) ifTrue: [
		pointcuts := pointcuts perform: (self composition) with: (self pointcut getPointcuts)  ].
	^pointcuts
	