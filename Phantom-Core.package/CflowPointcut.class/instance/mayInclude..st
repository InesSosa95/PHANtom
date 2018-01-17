as yet unclassified
mayInclude: aClass
	(self
		packageRestrictionIncludes: aClass)
		ifTrue: [ 
			| classParser |
			classParser := self parseReceivers: self receivers.
			^ (classParser matches: aClass definition) ]
		ifFalse: [ ^ false ]