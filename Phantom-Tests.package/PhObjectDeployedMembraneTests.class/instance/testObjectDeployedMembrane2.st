as yet unclassified
testObjectDeployedMembrane2
	| mock1 mock2 membrane membrane2 asp |
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhMockClass';
				selectors: 'test');
			advice: [:ctx | 'foo'];
			type: #around).
	membrane := PhMembrane new.
	membrane2 := PhMembrane new advise: membrane.
	asp registerOn:  membrane2.
	mock1 := PhMockMockClass new.
	mock2 := PhMockClass new.
	membrane deployOn: mock1.
	self assert: (mock1 callTestMock = 'foo').
	self assert: (mock2 test = 'test').
	self assert: (PhMockMockClass new callTestMock = 'test')