as yet unclassified
objectMembranes
	^ ObjectInstalledMembranes ifNil: [ObjectInstalledMembranes := WeakKeyToCollectionDictionary  new]