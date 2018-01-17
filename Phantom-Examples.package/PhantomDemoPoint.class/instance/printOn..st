as yet unclassified
printOn: aStream
	aStream nextPutAll: '(', (self x asString), ', ', (self y asString), ')[', (self theta asString), ' : ', (self rho asString), ']'.   