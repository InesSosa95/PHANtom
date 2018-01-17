install/uninstall
uninstallAll
	self installedAspects do: [:asp | asp uninstall].
	self installedMembranes removeAll.
	self cleanWrappers.  