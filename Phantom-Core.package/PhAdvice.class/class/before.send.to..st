instance creation
before: aPC send: aSymbol to: anObject 
	^self new pointcut: aPC; send: aSymbol to: anObject; type: #before.