chained-proceed
testChainedProceed5
	|  asp pc |
	asp := PhAspect new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#proceed).
	asp add: (PhAdvice new
		advice: [:context | 'asdf'. context proceed];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | 'foo',context proceed];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | 'bar',context proceed];
		pointcut: pc;
		type: #around).
	
	[asp install.
	self assert: (PhMockClass new test = 'foobartest')] ensure: [asp uninstall.]