as yet unclassified
testSimpleCFlow
	| pc asp |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		inCflowOf: (PhPointcut receivers: 'PhMockClass' selectors: 'toCallTest').
	asp := PhAspect new add: 
		(PhAdvice new 
			pointcut: pc;
			advice: [:ctx | 'inCflowOf'];
			type: #around).
	[asp install.
	self assert: (PhMockClass new test = 'test').
	self assert: (PhMockClass new toCallTest = 'inCflowOf')] ensure: [asp uninstall]