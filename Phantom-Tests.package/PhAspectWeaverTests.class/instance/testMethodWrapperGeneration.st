as yet unclassified
testMethodWrapperGeneration
"	| asp wrappers targetClass targetSelectors |
	
	asp := PhAspect new.
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
	self assert: ((wrappers at: (Array with: PhMockClass with: #foo)) reference classSymbol = #PhMockClass).
	self assert: ((wrappers at: (Array with: PhMockClass with: #test)) reference classSymbol = #PhMockClass).
	self assert: ((wrappers at: (Array with: PhMockClass with: #bar)) reference classSymbol = #PhMockClass).
	self assert: ((wrappers at: (Array with: PhMockClass with: #foo)) reference methodSymbol = #foo).
	self assert: ((wrappers at: (Array with: PhMockClass with: #test)) reference methodSymbol = #test).
	self assert: ((wrappers at: (Array with: PhMockClass with: #bar)) reference methodSymbol = #bar).
	] ensure: [asp uninstall]"