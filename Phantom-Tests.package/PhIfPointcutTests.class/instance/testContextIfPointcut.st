as yet unclassified
testContextIfPointcut
	| asp |
	asp := PhAspect new
		add: (PhAdvice
			around: (PhPointcut
				receivers: 'PhMockClass'
				selectors: 'echo:'
				context: #(arguments)
				if: [:ctx |
					(ctx arguments at: 1) = 'active'])
			advice: [:ctx | 'ok']).
	[asp install.
	self assert: ((PhMockClass new echo: 'active') = 'ok').
	self assert: ((PhMockClass new echo: 'test') = 'test')] ensure: [asp uninstall]