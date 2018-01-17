as yet unclassified
testAdvisedMembrane
	| membrane1 membrane2  asp1 asp2 pc |
	[pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test'.
	membrane1 := PhMembrane new.
	asp1 := PhAspect new
		add: (PhAdvice new
			advice: [:ctx | Transcript show: (PhMockClass new test); cr];
			pointcut: pc;
			type: #after).
	asp1 registerOn: membrane1.
	membrane2 := PhMembrane new advise: membrane1.
	asp2 := PhAspect new
		add: (PhAdvice new
			advice: [:ctx | Transcript show: 'Advised'; cr];
			pointcut: pc;
			type: #after).
	asp2 registerOn: membrane2.
	membrane1 install. 
	self assert: (PhMockClass new test = 'test').
	] ensure: [
	membrane1 uninstall]