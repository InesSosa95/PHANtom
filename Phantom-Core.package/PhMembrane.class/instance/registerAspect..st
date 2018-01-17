public
registerAspect: anAspect
	self registeredAspects add: anAspect.
	anAspect onMembranes add: self.
	PhAspectWeaver updateMembranes.