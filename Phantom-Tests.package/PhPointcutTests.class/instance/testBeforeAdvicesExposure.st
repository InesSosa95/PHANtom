context exposure
testBeforeAdvicesExposure
	| asp adv1 adv2 adv3 pc |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'foo';
		context: #(#advice).
	
	adv1 := PhAdvice new
		pointcut: pc;
		advice: [:context | 'foo'];
		type: #before.
	adv2 := PhAdvice new
		pointcut: pc;
		advice: [:context | 'bar'];
		type: #before.
	adv3 := PhAdvice new
		pointcut: pc;
		advice: [:context | 'foobar'];
		type: #before.    
	
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context beforeAdvice];
			type: #around);
		add: adv1;
		add: adv2;
		add: adv3.
	[asp install.
	
	self assert: (PhMockClass new foo includes: adv1).
	self assert: (PhMockClass new foo includes: adv2).
	self assert: (PhMockClass new foo includes: adv3).
	self assert: (PhMockClass new foo size = 3)] ensure: [asp uninstall.]