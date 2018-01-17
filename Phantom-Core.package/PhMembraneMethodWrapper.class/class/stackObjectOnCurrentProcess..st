as yet unclassified
stackObjectOnCurrentProcess: anObject
	self processObjectStack at: (Processor activeProcess) 
		ifPresent: [:col | col add: anObject]
		ifAbsent: [self processObjectStack at: (Processor activeProcess) put: (OrderedCollection with: anObject)]