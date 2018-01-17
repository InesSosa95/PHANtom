as yet unclassified
traceExit: aString
	(TraceLevel > 0) ifTrue: [
		self printExiting: aString.
		(TraceLevel = 2) ifTrue: [CallDepth := CallDepth -1]]  