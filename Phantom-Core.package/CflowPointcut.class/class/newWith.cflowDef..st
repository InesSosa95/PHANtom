as yet unclassified
newWith: aPhPointcut cflowDef: aPhPointcutDef
	^(self new)
		selectors: aPhPointcut selectors;
		receivers: aPhPointcut receivers;
		pointcut: aPhPointcut pointcut;
		selectIfMatch: aPhPointcut selectIfMatch;
		context: aPhPointcut context;
		precedence: aPhPointcut precedence;
		override: aPhPointcut override;
		selectorsMessage: aPhPointcut selectorsMessage;  
		restrictToPackages: aPhPointcut packageRestriction;
		if: aPhPointcut ifBlock;
		inCflowOf: aPhPointcutDef;
		yourself. 