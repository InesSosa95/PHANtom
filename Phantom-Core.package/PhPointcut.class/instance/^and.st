composing
& aPointcut
	^(self copy)
		pointcut: aPointcut;
		composition: #intersection:;
		context: (self mergeContext: aPointcut);
		yourself.    