public
uninstall
	PhAspectWeaver uninstallMembrane: self.
	"self registeredAspects do: [:each | each unregisterFrom: self]".
	"self advisedMembranes do: [:each | each advisingMembranes remove: self ifAbsent: nil]"