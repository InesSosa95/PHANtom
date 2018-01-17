as yet unclassified
printOn: aStream
	aStream
		nextPutAll: 'Squeare side = ';
		nextPutAll: s asString.
	super printOn: aStream.        