as yet unclassified
testMembraneVisibility
	| asp membrane aspectMembrane pc1 pc2 |
	pc1 := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test'.
	pc2 := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'testString'.
	
	membrane := PhMembrane new pointcut: pc1.
	aspectMembrane := PhMembrane new advise: membrane.
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: (pc1 | pc2);
			advice: [:ctx | 'foo'];
			type: #around).
	[asp registerOn: aspectMembrane.
	membrane install.
	self assert: (PhMockClass new test = 'foo').
	self deny: (PhMockClass new testString = 'foo').
	self assert: (PhMockClass new testString = 'test')] ensure: [membrane uninstall]    