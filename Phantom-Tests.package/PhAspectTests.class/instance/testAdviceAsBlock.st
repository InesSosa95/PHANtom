as yet unclassified
testAdviceAsBlock
	| mock  pc adv asp |
	mock := PhMockClass new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'foo'.
	adv := PhAdvice new
		advice: [:ctx | 'test'];
		pointcut: pc;  
		type: #around.
	asp := PhAspect new.
	asp add: adv.
	[asp install.
	self assert: (mock foo = 'test')] ensure: [asp uninstall]