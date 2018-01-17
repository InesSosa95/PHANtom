as yet unclassified
processMembraneStack
	^ ProcessMembraneStack ifNil: [ProcessMembraneStack := WeakKeyToCollectionDictionary new]