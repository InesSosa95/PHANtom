tests
testReentrancy
	| membrane asp pc |
	[pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test'.
	membrane := PhMembrane new.
	asp := PhAspect new
		add: (PhAdvice new
			advice: [:ctx | Transcript open; show: (PhMockClass new test); cr];
			pointcut: pc;
			type: #after).
	asp registerOn: membrane.
	membrane install.
	self assert: (PhMockClass new test = 'test').
	] ensure: [membrane uninstall.]