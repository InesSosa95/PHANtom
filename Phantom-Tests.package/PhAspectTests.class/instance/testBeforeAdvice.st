as yet unclassified
testBeforeAdvice
	|pc advBefore aspect |
	self assert: ((PhMockClass new) test = 'test').
	aspect := PhAspect new.
	pc := (PhPointcut new) receivers: 'PhMockClass'; selectors: 'test'; context: #(#receiver).
	advBefore := (PhAdvice new) advice: [:context | context receiver instVarNamed: 'testString' put: 'beforeTest' ]; pointcut: pc; type: #before.  
	aspect add: advBefore.
	
	[aspect install.
	self assert: ((PhMockClass new) test = 'beforeTest')] ensure: [aspect uninstall].  