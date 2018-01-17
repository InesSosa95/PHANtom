advice-manipulation
testCurrentAdviceRemove
	| asp1 asp2 asp3 pc |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'testString';
		precedence: #('PhMockAspect1' 'PhMockAspect2' 'PhMockAspect3');
		context: #(#advice).
		
	asp1 := PhMockAspect1 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context |
				| advices |
				advices := (context currentAdvice select: [:each | (each owner class = PhMockAspect2) not]).
				context currentAdvice: advices continueAt: (context currentAdviceIndex +1).
				context proceed];
			type: #around)..
	asp2 := PhMockAspect2 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context |
				'foo'];
			type: #around).
	asp3 := PhMockAspect3 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | 
				'bar'.];
			type: #around).
	
	  
	[asp2 install.
	asp3 install.
	self assert: (PhMockClass new testString = 'foo').
	asp1 install.
	self assert: (PhMockClass new testString = 'bar')
	] ensure: [
	asp1 uninstall.
	asp2 uninstall.
	asp3 uninstall]