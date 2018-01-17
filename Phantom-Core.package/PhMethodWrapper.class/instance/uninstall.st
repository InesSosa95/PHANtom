install-uninstall
uninstall
	self wrappedClass ifNil: [^self].
	super uninstall.
	self needCleanUp ifTrue: [
		SystemAnnouncer  uniqueInstance suspendAllWhile: [self wrappedClass removeSelector: self selector]]