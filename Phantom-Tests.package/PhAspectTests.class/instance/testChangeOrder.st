advice-manipulation
testChangeOrder
	|pc asp |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'foo';
		context: #(#advice).
		
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | 
				context aroundAdvice: (context aroundAdvice asArray reversed).
				context proceed.];
			type: #before);
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | 'bar'];
			type: #around);
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | 'foo'];
			type: #around).
	[asp install.
	self assert: (PhMockClass new foo = 'foo')] ensure: [asp uninstall.]