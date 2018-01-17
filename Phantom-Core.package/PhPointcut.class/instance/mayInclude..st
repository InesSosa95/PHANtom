accessing
mayInclude: aClass
	(self
		packageRestrictionIncludes: aClass)
		ifTrue: [ 
			| classParser |
			classParser := self parseReceivers: self receivers.
			self selectIfMatch
				ifTrue: [ 
					^ (classParser matches: aClass definition)]
				ifFalse: [
					^ (classParser matches: aClass definition) not] ]
		ifFalse: [ ^ false ]