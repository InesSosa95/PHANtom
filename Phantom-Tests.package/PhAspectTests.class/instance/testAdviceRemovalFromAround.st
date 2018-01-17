advice-manipulation
testAdviceRemovalFromAround
	| asp1 asp2 pc mock |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'counter';
		context: #(#advice #receiver).
		
	asp1 := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context |
				context aroundAdvice: #()];
			type: #before).
	asp2 := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | 'foo'];
		type: #around).
	[asp2 install. 
	mock := PhMockClass new.
	self assert: (mock counter = 'foo').
	asp1 install.
	"asp1 will remove plus advice on counter"
	self assert: (mock counter = 0)] ensure: [
	asp1 uninstall.
	asp2 uninstall.]