advice-manipulation
testChangeCurrent
	|pc asp1 asp2 asp3 |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'foo';
		context: #(#advice #proceed).
		
	asp1 := PhMockAspect1 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context |
				| current | 
				current := context currentAdvice asOrderedCollection select: [:each | each owner class = PhMockAspect2].
				context currentAdvice: current continueAt: 1.
				context proceed];
			type: #around).
	asp2 := PhMockAspect2 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | 'ok'];
			type: #around).
	asp3 := PhMockAspect3 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | 'not', context proceed asString];
			type: #around);
		precedence: #('PhMockAspect1' 'PhMockAspect3' 'PhMockAspect2').
	
	[asp1 install.
	asp2 install.
	asp3 install.
	self assert: (PhMockClass new foo = 'ok')] ensure: [asp1 uninstall. asp2 uninstall. asp3 uninstall.]