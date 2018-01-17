as yet unclassified
testCombinedIfPointcut2
	| pc ifpc adv asp |
	
	pc := PhPointcut receivers: 'PhMockClass' selectors: 'test'.
	ifpc:= PhPointcut receivers: 'PhMockClass' selectors: 'test:' context: #(arguments) if: [:ctx | (ctx arguments at: 1) = 'true'].
	adv := PhAdvice
		around: (ifpc | pc)
		advice: [:ctx |
			'ok'].
	asp := PhAspect new add: adv.
	[asp install.
	self assert: (PhMockClass new test = 'ok').
	self deny: ((PhMockClass new test: 'false') = 'ok').
	self assert: ((PhMockClass new test: 'true') = 'ok')] ensure: [asp uninstall]