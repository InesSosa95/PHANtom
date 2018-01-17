as yet unclassified
popObjectOnCurrentProcess
	self processObjectStack at: (Processor activeProcess) 
		ifPresent: [:col | col ifNotEmpty: [:collection | collection removeLast] ]