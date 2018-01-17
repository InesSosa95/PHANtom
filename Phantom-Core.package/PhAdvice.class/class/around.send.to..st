instance creation
around: aPC send: aSymbol to: anObject 
	^self new pointcut: aPC; send: aSymbol to: anObject; type: #around.