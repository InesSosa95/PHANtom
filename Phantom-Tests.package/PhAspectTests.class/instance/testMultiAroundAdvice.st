as yet unclassified
testMultiAroundAdvice
	| mock asp pc |
	mock := PhMockClass new.
	asp := PhAspect new.
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'plus';
		context: #(#receiver #proceed).
	asp add: (PhAdvice new
		advice: [:context | context receiver minus. context proceed];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | context receiver minus. context proceed];
		pointcut: pc;
		type: #around).
	asp add: (PhAdvice new
		advice: [:context | context receiver minus.];
		pointcut: pc;
		type: #around).
	
	[asp install.

	mock plus.
	self assert: (mock counter = -3)] ensure: [asp uninstall.]