as yet unclassified
testMethodWrapperDictionary
	| asp wrappers targetClass targetSelectors |
	
	"asp := PhAspect new.
	asp add: (PhAdvice new
				advice: [:context | 'foo'];
				pointcut: (PhPointcut new
					receivers: 'PhMockClass';
					selectors: 'foo');
				type: #before).
				
	 asp add: (PhAdvice new
				advice: [:context | 'foo'];
				pointcut: (PhPointcut new
					receivers: 'PhMockClass';
					selectors: 'test');
				type: #before).
	
	 asp add: (PhAdvice new
				advice: [:context | 'foo'];
				pointcut: (PhPointcut new
					receivers: 'PhMockClass';
					selectors: 'bar');
				type: #before).
				
	asp install.
	[wrappers := PhAspectWeaver classVarNamed: 'WrapperList'.
	self assert: (wrappers size = 3).
	self assert: (wrappers includesKey: (Array with: PhMockClass with: #foo)).
	self assert: (wrappers includesKey: (Array with: PhMockClass with: #test)).
	self assert: (wrappers includesKey: (Array with: PhMockClass with: #bar)).
	] ensure: [asp uninstall]"