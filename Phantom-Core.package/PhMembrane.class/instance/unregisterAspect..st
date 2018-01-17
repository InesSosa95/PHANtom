public
unregisterAspect: anAspect
	self registeredAspects remove: anAspect ifAbsent: nil.
	anAspect onMembranes remove: self ifAbsent: nil.
	
	"self flag: 'I dont understand why I need to flush memoization caches here --JF'."
	"PhAspectWeaver flushPointcutsMemo.
	PhPointcut resetMemoizedcd."
	
	PhAspectWeaver updateMembranes.