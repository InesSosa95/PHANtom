context exposure
testDynamicContext
	| pc asp |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#arguments #receiver);
		dynamicContextBlock: [:contextObject :thereContext |
			| idx |
			idx := (1 to: (thereContext contextStack size)) findLast: [:index |
				((thereContext contextStack at: index) receiver) == ((thereContext contextStack at: 1) receiver)].
			contextObject dynamicContext at: #sender put: (thereContext contextStack at: (idx+5)) receiver].  

	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver test: (context dynamicContext at: #sender)];
			type: #before).
	[asp install.
	
	self assert: ((PhMockClass new test) == self)] ensure: [asp uninstall].    
		