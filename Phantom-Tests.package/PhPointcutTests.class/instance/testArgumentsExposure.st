context exposure
testArgumentsExposure
	| pc asp |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test:';
		context: #(#arguments).
	
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context arguments at: 1];
			type: #around).
	
	[
	asp install.
	
	self assert: ((PhMockClass new test: 'argstests') = 'argstests')] ensure: [asp uninstall].    
		