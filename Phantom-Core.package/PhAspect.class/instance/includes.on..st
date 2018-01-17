private
includes: aMethod on: aClass
	self adviceCollection do: [ :adv | 
		(adv pointcut includes: aMethod on: aClass)
			ifTrue: [^true] ].
	^ false