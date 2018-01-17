as yet unclassified
testRenameClass
	| asp |
	[SmalltalkImage current renameClassNamed: 'PhNoOneMock' as: 'PhNoOneOneMock'.
	
	asp := PhAspect new add: (PhAdvice new
		pointcut: (PhPointcut new
			receivers: 'PhNoOneMock';
			selectors: 'hash');
		advice: [:ctx | 'foo'];
		type: #around).
	asp install.
	SmalltalkImage current renameClassNamed: 'PhNoOneOneMock' as: 'PhNoOneMock'.
	self checkNoOneHash] ensure: [asp uninstall]