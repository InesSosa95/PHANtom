as yet unclassified
addMembranesOf: currentAdvice
	| membraneSet objectDeployedMembraneSet |
	membraneSet := WeakSet new.
	objectDeployedMembraneSet := WeakSet new.
	membraneSet
		addAll: (self adviceGroup advisingMembranes select: [ :mbr | mbr registeredAspects includes: currentAdvice owner ]).
	objectDeployedMembraneSet
		addAll: (self adviceGroup objectDeployedAdvisingMembranes select: [:mbr | mbr registeredAspects includes: currentAdvice owner] ).
	self adviceGroup wrapper setActiveMembranes: membraneSet.
	self adviceGroup wrapper setObjectDeployedActiveMembranes:  objectDeployedMembraneSet.