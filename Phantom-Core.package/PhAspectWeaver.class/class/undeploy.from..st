as yet unclassified
undeploy:  aMembrane from: anObject
	self objectMembranes at: anObject 
		ifPresent: [:value | 
			| update |
			update := true.
			value remove: aMembrane ifAbsent: [update := false].
			update ifTrue: [self updateMembranes ]]