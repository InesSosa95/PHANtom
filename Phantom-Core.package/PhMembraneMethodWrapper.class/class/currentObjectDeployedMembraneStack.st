as yet unclassified
currentObjectDeployedMembraneStack
	^ self processObjectDeployedMembraneStack at: (Processor activeProcess) ifAbsent: [#()]