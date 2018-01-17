as yet unclassified
testCreateMethod
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
	] ensure: [
	asp uninstall.
	(SmalltalkImage current at: #PhNoOneMock) removeSelector: #foo]