as yet unclassified
testCombinedIfPointcut
	| alwaysFalsePc alwaysTruePc orPc andPc orAsp andAsp |
	alwaysFalsePc := PhPointcut
		receivers: 'PhMockClass'
		selectors: 'test'
		if: [:ctx | false].
	alwaysTruePc := PhPointcut
		receivers: 'PhMockClass'
		selectors: 'test'
		if: [:ctx | true].
	orPc := alwaysFalsePc | alwaysTruePc.
	andPc := alwaysTruePc & alwaysFalsePc.
	
	orAsp := PhAspect new
		add: (PhAdvice
			around: orPc
			advice: [:ctx | 'orOk']).
	andAsp := PhAspect new
		add: (PhAdvice
			around: andPc
			advice: [:ctx | 'orOk']).
	[orAsp install.
	self assert: (PhMockClass new test = 'orOk')] ensure: [orAsp uninstall].
	[andAsp install.
	self assert: (PhMockClass new test = 'test')] ensure: [andAsp uninstall].