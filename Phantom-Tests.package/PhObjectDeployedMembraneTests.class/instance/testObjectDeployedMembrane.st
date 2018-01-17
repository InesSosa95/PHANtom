as yet unclassified
testObjectDeployedMembrane
	| mock1 mock2 membrane asp |
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhMockClass';
				selectors: 'test');
			advice: [:ctx | 'foo'];
			type: #around).
	membrane := PhMembrane new.
	asp registerOn:  membrane.
	mock1 := PhMockClass new.
	mock2 := PhMockClass new.
	membrane deployOn: mock1.
	self deny: (mock1 test = 'foo').
	self assert: (mock2 test = 'test').