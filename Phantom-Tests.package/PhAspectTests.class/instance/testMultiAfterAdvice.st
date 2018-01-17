as yet unclassified
testMultiAfterAdvice
	| mock asp pc |
	mock := PhMockClass new.
	asp := PhAspect new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'counter';
		context: #(receiver).  
	asp add: (PhAdvice new
		advice: [:context | context receiver minus];
		pointcut: pc;
		type: #after).
	asp add: (PhAdvice new
		advice: [:context | context receiver minus];
		pointcut: pc;
		type: #after).
	asp add: (PhAdvice new
		advice: [:context | context receiver minus];
		pointcut: pc;
		type: #after).
	
	[asp install.
	
	self assert: (mock counter = 0).
	self assert: (mock counter = -3)] ensure: [asp uninstall.]