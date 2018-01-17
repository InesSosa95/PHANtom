install/uninstall
uninstallMembrane: aMembrane
	self cleanWrappers.
	self removeMembrane: aMembrane.
	self compileAndInstallMembranes