as yet unclassified
addObjectDeployedMembranesPointcutsTo: aPointcutDict
	| membranes allMembranes cfPointcuts |
	membranes := Set new.
	allMembranes := Set new.
	cfPointcuts := OrderedCollection new.
	self objectMembranes keysDo: [:obj |
		((obj class allSelectors) difference: (ProtoObject allSelectors))
			do: [:each |
				cfPointcuts add: (Array with: (obj class) with: each)]].
	self objectMembranes do: [ :each | membranes addAll: each ].
	membranes do: [ :mbr | self addAllAdvisingMembranesOf: mbr to: allMembranes ].
	allMembranes
		do: [ :membrane | 
			(self getMembranePointcuts: membrane)
				do: [ :pointcut | aPointcutDict at: pointcut ifAbsent: [ aPointcutDict at: pointcut put: #() ] ] ].
	cfPointcuts do: [:pc | aPointcutDict at: pc ifAbsent: [aPointcutDict at: pc put: #()]].
	^ aPointcutDict