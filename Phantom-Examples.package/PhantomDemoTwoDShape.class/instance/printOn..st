as yet unclassified
printOn: aStream
	aStream
		nextPutAll: ' @ (';
		nextPutAll: x asString;
		nextPutAll: ', ';
		nextPutAll: y asString;
		nextPutAll: ') '        
	    