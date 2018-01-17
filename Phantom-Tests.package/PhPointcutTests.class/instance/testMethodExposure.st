context exposure
testMethodExposure
	| pc asp |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#proceed).
	
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context proceed];
			type: #around).
	[asp install.
	
	self assert: ((PhMockClass new test) = 'test')] ensure: [asp uninstall].    
		