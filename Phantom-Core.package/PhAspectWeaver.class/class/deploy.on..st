as yet unclassified
deploy: aMembrane on: anObject
	self objectMembranes at: anObject
		ifPresent: [:col | col add: aMembrane]
		ifAbsent: [
			self objectMembranes at: anObject put: (Set with: aMembrane)].
	WeakRegistry default add: anObject executor: aMembrane.
	self updateMembranes.