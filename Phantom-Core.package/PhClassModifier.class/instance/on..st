initialize-release
on: aPointcut
	pointcut := aPointcut.
	modifiedClasses := self filterMatchedClasses:  (aPointcut getMatchedClasses).