context exposure
testAroundAdvicesExposure
	| asp adv1 adv2 adv3 pc |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'foo';
		context: #(#advice).
	
	adv1 := PhAdvice new
			pointcut: pc;
			advice: [:context | context aroundAdvice];
			type: #around.
	adv2 :=  PhAdvice new
			pointcut: pc;
			advice: [:context | context aroundAdvice];
			type: #around.
	adv3 :=  PhAdvice new
			pointcut: pc;
			advice: [:context | context aroundAdvice];
			type: #around.
	
	asp := PhAspect new
		add: adv1;
		add: adv2;
		add: adv3.
	[asp install.
	
	self assert: (PhMockClass new foo includes: adv1).
	self assert: (PhMockClass new foo includes: adv2).
	self assert: (PhMockClass new foo includes: adv3).
	self assert: (PhMockClass new foo size = 3)] ensure: [asp uninstall.]