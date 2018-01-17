notification
methodRemoved: anEvent
	(anEvent methodRemoved isKindOf: PhMethodWrapper)
		ifTrue: [ WrapperList removeKey: (Array with: anEvent methodClass with: anEvent selector) ].
	self updateEnabled
		ifTrue: [ 
			self flushPointcutsMemo.
			self updateMembranes ]