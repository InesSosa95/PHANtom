private
membrane: aMembrane mayInclude: aClass
	aMembrane pointcut
		ifNotNil: [ :pc | ^ pc mayInclude: aClass ]
		ifNil: [ aMembrane registeredAspects
				do: [ :asp | 
					asp adviceCollection
						do: [ :adv | 
							(adv pointcut mayInclude: aClass)
								ifTrue: [ ^ true ] ].
					asp classModifiers
						do: [ :cm | 
							(cm pointcut mayInclude: aClass)
								ifTrue: [ ^ true ] ] ].
			^ false ]