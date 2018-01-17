private
method: aMethod on: aClass isIncludedOn: aMembrane
	aMembrane pointcut
		ifNotNil: [ :pc | ^ pc includes: aMethod on: aClass ]
		ifNil: [ aMembrane registeredAspects
				do: [ :asp | 
					asp adviceCollection
						do: [ :adv | 
							(adv pointcut includes: aMethod on: aClass)
								ifTrue: [ ^ true ] ].
					asp classModifiers
						do: [ :cm | 
							(cm pointcut includes: aMethod on: aClass)
								ifTrue: [ ^ true ] ] ].
			^ false ]