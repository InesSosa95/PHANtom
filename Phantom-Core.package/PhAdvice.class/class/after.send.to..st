instance creation
after: aPC send: aSymbol to: anObject 
	^self new pointcut: aPC; send: aSymbol to: anObject; type: #after.