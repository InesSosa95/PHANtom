as yet unclassified
testMultiBeforeAdvice
	| mock asp pc |
	mock := PhMockClass new.
	asp := PhAspect new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'counter';
		context: #(#receiver).  
	asp add: (PhAdvice new
		advice: [:context | context receiver minus];
		pointcut: pc;
		type: #before).
	asp add: (PhAdvice new
		advice: [:context | context receiver minus];
		pointcut: pc;
		type: #before).
	asp add: (PhAdvice new
		advice: [:context | context receiver minus];
		pointcut: pc;
		type: #before).
	
	[asp install.
	
	self assert: (mock counter = -3)] ensure: [asp uninstall.]