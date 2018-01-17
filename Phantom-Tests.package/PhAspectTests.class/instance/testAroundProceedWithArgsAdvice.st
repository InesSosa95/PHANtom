as yet unclassified
testAroundProceedWithArgsAdvice
	| pc adv asp mock |
	mock := PhMockClass new.
	pc := PhPointcut new
		receivers: 'PhMockClass'; 
		selectors: 'echo:';
		context: #(#proceed #arguments).
	adv := PhAdvice new
		advice: [:context |  context proceed: (context arguments collect: [:a | a asUppercase])];
		pointcut: pc;
		type: #around.
	asp := PhAspect new.
	asp add: adv.
	
	[asp install.
	
	self assert: ((mock echo: 'test') = 'TEST')] ensure: [asp uninstall]