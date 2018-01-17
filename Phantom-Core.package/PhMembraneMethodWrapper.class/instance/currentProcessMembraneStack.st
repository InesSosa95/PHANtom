as yet unclassified
currentProcessMembraneStack
	^ PhMembraneMethodWrapper currentProcessMembraneStack ifEmpty: [self membranes select: [:mbr | mbr isBaseMembrane]] 