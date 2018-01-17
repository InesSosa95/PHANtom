instance creation
around: aPC advice: aBlock
	^self new pointcut: aPC; advice: aBlock; type: #around