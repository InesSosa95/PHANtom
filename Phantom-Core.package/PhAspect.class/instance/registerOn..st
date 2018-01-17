install-uninstall
registerOn: aMembrane
	aMembrane registerAspect: self.
	self onMembranes add: aMembrane.
	self installClassModification.