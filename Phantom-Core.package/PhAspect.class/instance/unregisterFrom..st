install-uninstall
unregisterFrom: aMembrane
	aMembrane unregisterAspect: self.
	self onMembranes remove: aMembrane ifAbsent: nil.
	self onMembranes isEmpty ifTrue: [self uninstallClassModification]