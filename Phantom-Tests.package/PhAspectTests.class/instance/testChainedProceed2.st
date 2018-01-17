chained-proceed
testChainedProceed2
	|  asp pc |
	asp := PhAspect new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#proceed).
	asp add: (PhAdvice new
		advice: [:context | 'bar'];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | 'foo',context proceed];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | 'test',context proceed];
		pointcut: pc;
		type: #around).
	
	[asp install.
	PhMockClass new test.
	self assert: (PhMockClass new test = 'bar')] ensure: [asp uninstall.]