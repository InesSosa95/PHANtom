as yet unclassified
testAfterAdvice
	|pc test advAfter aspect mock |
	mock := PhMockClass new.
	self assert: (mock test = 'test').
	aspect := PhAspect new.
	pc := (PhPointcut new) receivers: 'PhMockClass'; selectors: 'test'; context: #(#receiver).
	advAfter := (PhAdvice new) advice: [:context | context receiver instVarNamed: 'testString' put: 'afterTest' ]; pointcut: pc; type: #after.  
	aspect add: advAfter.
	
	[aspect install.

	self assert: (mock test = 'test').
	self assert: (mock testString = 'afterTest')] ensure: [aspect uninstall]  