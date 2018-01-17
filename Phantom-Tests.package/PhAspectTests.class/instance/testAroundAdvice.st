as yet unclassified
testAroundAdvice
	| pc adv asp mock |
	mock := PhMockClass new.
	pc := PhPointcut new
		receivers: 'PhMockClass'; 
		selectors: 'test'.
	adv := PhAdvice new
		advice: [:ctx | 'around'];
		pointcut: pc;
		type: #around.
	asp := PhAspect new.
	asp add: adv.
	
	[asp install.
	
	self assert: (mock test = 'around')] ensure: [asp uninstall]