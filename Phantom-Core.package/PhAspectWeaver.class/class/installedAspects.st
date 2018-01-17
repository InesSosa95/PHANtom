accessors
installedAspects
	| aspectSet allMembranes |
	aspectSet := Set new.
	allMembranes := Set new.
	InstalledMembranes do: [:mbr | self addAllAdvisingMembranesOf: mbr to: allMembranes].
	allMembranes do: [:e | 
		aspectSet addAll: e registeredAspects].
	^ aspectSet.