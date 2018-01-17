as yet unclassified
getAdviceFrom: aMembraneSet and: objMembraneSet
	| aspectsSet advice stack |
	cflowStack := nil.
	aspectsSet := Set new.
	advice := OrderedCollection new.
	aMembraneSet do: [ :each | aspectsSet addAll: each registeredAspects ].
	objMembraneSet do: [:each | aspectsSet addAll: each registeredAspects ].
	aspectsSet
		do: [ :asp | 
			asp adviceCollection
				do: [ :adv | 
					(adv pointcut includes: self selector on: self wrappedClass)
						ifTrue: [ advice add: adv ] ] ].
"	self halt."
	advice removeAllSuchThat: [:adv | (adv isActiveOnCflowOf: self) not].
	advice := PhAspectWeaver setPrecedenceOn: (PhAspectWeaver setInheritancePrecedenceOn: advice asArray).
	^ advice