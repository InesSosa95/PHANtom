notification
methodModification: anEvent
	(anEvent oldMethod isKindOf: PhMethodWrapper)
		ifTrue: [ 
			anEvent oldMethod oldMethod: anEvent newMethod.
			anEvent oldMethod needCleanUp: false.
			anEvent oldMethod install ]