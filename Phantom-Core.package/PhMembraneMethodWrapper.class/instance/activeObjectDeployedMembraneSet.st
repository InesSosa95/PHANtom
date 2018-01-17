as yet unclassified
activeObjectDeployedMembraneSet
	| mbrSet callStack |
	callStack := PhMembraneMethodWrapper currentProcessObjectStack.
	mbrSet := Set new.
	callStack do: [:rc |
		PhAspectWeaver objectMembranes at: rc ifPresent: [:mbr | mbrSet addAll: mbr]].
	^ mbrSet.
"	| ct mbrSet callStack |
	mbrSet := Set new.
	callStack := thisContext contextStack.
	callStack do: [:each |
		PhAspectWeaver objectMembranes at: (each receiver) ifPresent: [:mbr | mbrSet addAll: mbr] ].
	^ mbrSet"