context exposure
testReceiverExposure
	| pc asp mock |
	mock := PhMockClass new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#receiver).
	
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver];
			type: #around).
	[asp install.
	
	self assert: (mock test = mock)] ensure: [asp uninstall].    
		