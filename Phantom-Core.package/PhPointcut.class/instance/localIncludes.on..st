accessing
localIncludes: aSelector on: aClass
"	(self
		packageRestrictionIncludes: aClass)
		ifTrue: [ 
			| classParser selectorParser |
			classParser := self parseReceivers: self receivers.
			selectorParser := self parseSelectors: self selectors.
			selectIfMatch
				ifTrue: [ 
					(classParser matches: aClass definition)
						ifTrue: [ ^ selectorParser matches: aSelector asString]
						ifFalse: [^ false] ]
				ifFalse: [
					(classParser matches: aClass definition)
						ifTrue: [ ^ (selectorParser matches: aSelector asString) not ]
						ifFalse: [^true]] ]
		ifFalse: [ ^ false ]"
		(self mayInclude: aClass)
			ifTrue: [
				| selectorParser |
				selectorParser := self parseSelectors: self selectors.
				self selectIfMatch
					ifTrue: [ ^ selectorParser matches: aSelector asString]
					ifFalse: [^ (selectorParser matches: aSelector asString) not]]
			ifFalse: [^false]