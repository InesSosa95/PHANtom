composing
| aPointcut
	^(self copy)
		pointcut: aPointcut;
		composition: #union:;
		context: (self mergeContext: aPointcut);
		yourself.  