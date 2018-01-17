public
unAdvise: aMembrane
	self advisedMembranes remove: aMembrane.
	aMembrane advisingMembranes remove: self.