private
getMembranePointcuts: aMembrane
	aMembrane pointcut
		ifNotNil: [ :pc | ^ pc getPointcuts ]
		ifNil: [ "aMembrane pointcut
		ifNotNilDo: [ :pc | ^ pc getPointcuts ]
		ifNil: [ 
			aMembrane advisedMembranes
				ifNil: [ ^ #() ]
				ifNotNil: [ 
					| pcSet |
					pcSet := Set new.
					aMembrane registeredAspects
						do: [ :asp | asp adviceCollection do: [ :adv | pcSet addAll: adv pointcut getPointcuts ] ].
					^ pcSet ] ]"
			| pcSet |
			pcSet := Set new.
			aMembrane registeredAspects
				do: [ :asp | 
					asp adviceCollection
						do: [ :adv | pcSet addAll: adv pointcut getPointcuts ] ].
			^ pcSet ]