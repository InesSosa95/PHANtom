as yet unclassified
testEmptyContextFalseIfPointcut
	| asp |
	asp := PhAspect new
		add: (PhAdvice
			around: (PhPointcut
				receivers: 'PhMockClass'
				selectors: 'test'
				if: [:ctx | false])
			advice: [:ctx | 'ok']).
	[asp install.
	self assert: (PhMockClass new test = 'test').
	self deny: (PhMockClass new test = 'ok')] ensure: [asp uninstall]