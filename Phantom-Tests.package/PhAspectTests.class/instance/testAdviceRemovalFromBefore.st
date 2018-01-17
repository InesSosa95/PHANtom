advice-manipulation
testAdviceRemovalFromBefore
	| asp1 asp2 pc mock |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'counter';
		context: #(#advice #receiver #proceed).
		
	asp1 := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context |
				context aroundAdvice: (context aroundAdvice allButFirst)];
			type: #before).
	asp2 := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver plus. context proceed];
		type: #around);
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context proceed];
		type: #around).
	[asp2 install.
	mock := PhMockClass new.
	self assert: (mock counter = 1).
	asp1 install.
	"asp1 will remove plus advice on counter"
	self assert: (mock counter = 1).
	self assert: (mock counter = 1)] ensure: [
	asp1 uninstall.
	asp2 uninstall.]