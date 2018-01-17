private
includes: aMethod on: aClass
	|  membranes objectMembranes |
	
	membranes := Set new.
	objectMembranes := Set new.
	self installedMembranes do: [: mbr |
		self addAllAdvisingMembranesOf: mbr to: membranes].
	self objectMembranes do: [ :each | objectMembranes addAll: each ].
	objectMembranes do: [ :mbr | self addAllAdvisingMembranesOf: mbr to: membranes ].
	membranes do: [:membrane |
		(self method: aMethod on: aClass isIncludedOn: membrane)
			ifTrue: [^true] ].
	^ false