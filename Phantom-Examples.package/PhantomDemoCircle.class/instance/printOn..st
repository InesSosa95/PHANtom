as yet unclassified
printOn: aStream
	aStream
		nextPutAll: 'Circle radius = ';
		nextPutAll: r asString.
	super printOn: aStream.          