as yet unclassified
traceEntry: aString
	(TraceLevel > 0) ifTrue: [
		(TraceLevel = 2) ifTrue: [CallDepth := CallDepth +1].
		self printEntering: aString]  