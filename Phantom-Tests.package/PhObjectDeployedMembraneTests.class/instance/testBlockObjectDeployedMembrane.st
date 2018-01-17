as yet unclassified
testBlockObjectDeployedMembrane
"	| mock block membrane membrane2 asp |
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhMockClass';
				selectors: 'test');
			advice: ['foo'];
			type: #around).
	membrane := PhMembrane new.
	membrane2 := PhMembrane new advise: membrane.
	asp registerOn:  membrane2.
	mock := PhMockClass new.
	block := [mock test].
	membrane deployOn:  block.
	self assert: (mock test = 'test').
	self assert: (block value = 'foo')."