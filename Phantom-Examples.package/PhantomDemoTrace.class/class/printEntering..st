as yet unclassified
printEntering: aString
	self printIdent.
	TraceStream nextPutAll: '--> ', aString.
	TraceStream nextPut: Character cr.      