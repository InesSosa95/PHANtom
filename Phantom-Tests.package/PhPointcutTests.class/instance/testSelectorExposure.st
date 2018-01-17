context exposure
testSelectorExposure
	| pc asp |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#selector).
	
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context selector];
			type: #around).
	[asp install.
	
	self assert: ((PhMockClass new test) = #test)] ensure: [asp uninstall].    
		