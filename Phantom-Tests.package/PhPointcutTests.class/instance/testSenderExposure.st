context exposure
testSenderExposure
	| pc asp |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#sender).
	
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context sender name asString];
			type: #around).
	[asp install.
	
	self assert: ((PhMockClass new test) = self name asString)] ensure: [asp uninstall].    
		