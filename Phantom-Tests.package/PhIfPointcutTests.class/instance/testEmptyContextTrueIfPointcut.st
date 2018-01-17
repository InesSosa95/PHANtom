as yet unclassified
testEmptyContextTrueIfPointcut
	| asp |
	asp := PhAspect new
		add: (PhAdvice
			around: (PhPointcut
				receivers: 'PhMockClass'
				selectors: 'test'
				if: [:ctx | true])
			advice: [:ctx | 'ok']).
	[asp install.
	self assert: (PhMockClass new test = 'ok').
	self deny: (PhMockClass new test = 'test')] ensure: [asp uninstall]