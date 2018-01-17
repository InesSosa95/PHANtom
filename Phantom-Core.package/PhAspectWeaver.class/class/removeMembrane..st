accessors
removeMembrane: aMembrane
	self installedMembranes remove: aMembrane ifAbsent: nil.