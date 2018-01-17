update
update
	self updateEnabled
		ifTrue: [ 
			self flushPointcutsMemo.
			PhPointcut resetMemoizedcd.
			self updateMembranes ]