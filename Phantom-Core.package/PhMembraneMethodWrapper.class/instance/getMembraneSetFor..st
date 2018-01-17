as yet unclassified
getMembraneSetFor: activeMembranes
	activeMembranes 
		ifEmpty: [^ self membranes select: [:mbr | mbr isBaseMembrane ]]
		ifNotEmpty: [:mbrGrp | 
			| mbrSet |
			mbrSet := Set new.
			mbrGrp do: [:each | mbrSet addAll: each advisingMembranes].
			mbrSet := mbrSet select: [:mb | (mb pointcut = nil) or: [mb pointcut includes: (self selector) on: self wrappedClass]].
			^ mbrSet] 