notification
verifyNewMethod: anEvent
	self updateEnabled ifTrue: [self flushPointcutsParser].
	(self includes: anEvent selector on: anEvent methodClass)
		ifTrue: [ 
			self update ]