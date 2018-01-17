as yet unclassified
processObjectStack
	^ ProcessObjectStack ifNil: [ProcessObjectStack := WeakKeyToCollectionDictionary new]