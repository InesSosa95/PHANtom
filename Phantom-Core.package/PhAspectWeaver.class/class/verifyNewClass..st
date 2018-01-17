notification
verifyNewClass: anEvent
	self updateEnabled ifTrue: [self flushPointcutsParser].
	(self mayInclude: anEvent classAdded)
		ifTrue: [ 
			self update ]