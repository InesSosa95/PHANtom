chained-proceed
testChainedProceed1
	|  asp pc |
	asp := PhAspect new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#proceed).
	asp add: (PhAdvice new
		advice: [:context | 'test',context proceed];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | 'test',context proceed];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | 'test',context proceed];
		pointcut: pc;
		type: #around).
	
	[asp install.
	self assert: (PhMockClass new test = 'testtesttesttest')] ensure: [asp uninstall.]