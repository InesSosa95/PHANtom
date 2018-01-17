accessing
context: anArray 
	(self checkContextDefinition: anArray)
		ifTrue: [	context := anArray ]
		ifFalse: [self error: 'bad context definition']