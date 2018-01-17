as yet unclassified
currentProcessObjectStack
	^ self processObjectStack at: (Processor activeProcess) ifAbsent: [#()]