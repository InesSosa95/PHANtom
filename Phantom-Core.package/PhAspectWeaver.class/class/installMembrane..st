install/uninstall
installMembrane: aMembrane
	self cleanWrappers.
	self addMembrane: aMembrane.
	self compileAndInstallMembranes