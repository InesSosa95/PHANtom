advice-manipulation
testAdviceRemovalFromAfter
	| asp1 asp2 pc mock |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'counter';
		context: #(#advice #receiver).
		
	asp1 := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context |
				context afterAdvice: #()];
			type: #before).
	asp2 := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver plus];
		type: #after).
	
	[asp2 install.
	mock := PhMockClass new.
	self assert: (mock counter = 0).
	self assert: (mock counter = 1).
	asp1 install.
	"asp1 will remove plus advice on counter"
	self assert: (mock counter = 2).
	self assert: (mock counter = 2)] ensure: [
	asp1 uninstall.
	asp2 uninstall.]