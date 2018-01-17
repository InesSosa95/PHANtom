as yet unclassified
testAroundAround
	| pc advice innerAspect outerAspect mock |
	mock := PhMockClass new.
	pc := PhPointcut receivers: 'PhMockClass' selectors: 'method2' context: #(#receiver #proceed).
	advice := PhAdvice around: pc advice: [ :context | 'aspectualBehavior' ].
	innerAspect := PhAspect new add: advice.
	pc := PhPointcut receivers: 'PhMockClass' selectors: 'callMethod2' context: #(#receiver #proceed).
	advice := PhAdvice around: pc advice: [ :context | context proceed ].
	outerAspect := PhAspect new add: advice.
	[ 
	innerAspect install.
	outerAspect install.
	self assert: mock callMethod2 = 'aspectualBehavior' ]
		ensure: [ 
			innerAspect uninstall.
			outerAspect uninstall ]