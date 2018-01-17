private
mayInclude: aClass
	|  membranes objectMembranes |
	
	membranes := Set new.
	objectMembranes := Set new.
	self installedMembranes do: [: mbr |
		self addAllAdvisingMembranesOf: mbr to: membranes].
	self objectMembranes do: [ :each | objectMembranes addAll: each ].
	objectMembranes do: [ :mbr | self addAllAdvisingMembranesOf: mbr to: membranes ].
	membranes do: [:membrane |
		(self membrane: membrane mayInclude: aClass)
			ifTrue: [^true] ].
	^ false