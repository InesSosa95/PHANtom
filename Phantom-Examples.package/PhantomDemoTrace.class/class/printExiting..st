as yet unclassified
printExiting: aString
	self printIdent.
	TraceStream nextPutAll: '<-- ', aString.
	TraceStream nextPut: Character cr.      