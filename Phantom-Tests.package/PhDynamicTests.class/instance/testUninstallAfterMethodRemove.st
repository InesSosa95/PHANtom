as yet unclassified
testUninstallAfterMethodRemove
	| asp |
	[
	asp := PhAspect new add: (PhAdvice new
		pointcut: (PhPointcut new
			receivers: 'PhNoOneMock';
			selectors: 'foo');
		advice: [:ctx | 'foo'];
		type: #around).
	
	asp install.
	self addFooOnPhNoOneMock.
	self checkNoOneFoo.
	(SmalltalkImage current at: #PhNoOneMock) removeSelector: #foo.
	self uninstall: asp.
	] ensure: [
	asp uninstall.
	(SmalltalkImage current at: #PhNoOneMock) removeSelector: #foo]