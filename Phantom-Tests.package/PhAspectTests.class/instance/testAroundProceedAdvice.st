as yet unclassified
testAroundProceedAdvice
	| pc adv asp mock |
	mock := PhMockClass new.
	pc := PhPointcut new
		receivers: 'PhMockClass'; 
		selectors: 'test';
		context: #(#proceed).  
	adv := PhAdvice new
		advice: [:context | 'around', context proceed];
		pointcut: pc;
		type: #around.
	asp := PhAspect new.
	asp add: adv.
	
	[asp install.
	
	self assert: (mock test = 'aroundtest')] ensure: [asp uninstall]