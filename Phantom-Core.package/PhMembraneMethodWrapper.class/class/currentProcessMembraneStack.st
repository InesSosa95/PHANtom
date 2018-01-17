as yet unclassified
currentProcessMembraneStack
	^ self processMembraneStack at: (Processor activeProcess) ifAbsent: [#()]