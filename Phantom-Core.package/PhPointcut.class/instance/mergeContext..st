composing
mergeContext: aPointcut
	|newctx|
	newctx := self context asSet.
	newctx addAll: aPointcut context.
	^newctx asArray.  
	