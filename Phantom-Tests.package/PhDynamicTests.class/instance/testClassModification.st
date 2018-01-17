tests
testClassModification
	| asp advice |
	[
	advice := (PhAdvice new
		pointcut: (PhPointcut new
			receivers: self aPhMockClassParserWithPPPInstanceVar;
			selectors: 'foo');
			advice: [:ctx | 'foo'];
			type: #around).
			
	asp := (PhAspect new add: advice) install.
	
	asp install.
	self deny: (PhMockClass new foo = 'foo').  
	(PhMockClass addInstVarNamed: 'ccc') new.
		self assert: ((SmalltalkImage current at: #PhMockClass) new foo = 'foo').
	self checkPhMockClassFoo.
	] ensure: [
	asp uninstall.
	PhMockClass removeInstVarNamed: 'ccc'.]