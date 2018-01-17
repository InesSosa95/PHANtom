as yet unclassified
testNewSubClassOnSystem
	| asp |
	[
	self removeMockSubclass.
	asp := PhAspect new add: (PhAdvice new
		pointcut: (PhPointcut new
			receivers: 'PhMockClass+';
			selectors: 'foo');
		advice: [:ctx | 'foo'];
		type: #around).
	
	asp install.
	self createMockClassSubclass.
	self checkPhMockSubclassFoo.
	] ensure: [asp uninstall]
	