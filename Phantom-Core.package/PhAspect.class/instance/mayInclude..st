private
mayInclude: aClass
	self adviceCollection do: [ :adv | 
		(adv pointcut mayInclude: aClass)
			ifTrue: [^true] ].
	^ false