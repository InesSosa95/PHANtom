as yet unclassified
testNewClassOnSystem
	| asp |
	[self removeNoOneClass.
	
	asp := PhAspect new add: (PhAdvice new
		pointcut: (PhPointcut new
			receivers: 'PhNoOneMock';
			selectors: 'hash');
		advice: [:ctx | 'foo'];
		type: #around).
	
	asp install.
	self createNoOneClass.
	self checkNoOneHash.
	] ensure: [asp uninstall]
	