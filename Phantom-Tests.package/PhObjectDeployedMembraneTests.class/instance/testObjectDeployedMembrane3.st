as yet unclassified
testObjectDeployedMembrane3
	| mock1 mock2 membrane asp aspMembrane |
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhMockClass';
				selectors: 'test');
			advice: [:ctx | 'foo'];
			type: #around).
	membrane := PhMembrane new.
	aspMembrane := PhMembrane new advise: membrane.
	asp registerOn:  aspMembrane.
	mock1 := PhMockClass new.
	mock2 := PhMockClass new.
	membrane deployOn: mock1.
	self assert: (mock1 test = 'foo').
	self assert: (mock2 test = 'test').