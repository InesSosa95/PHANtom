as yet unclassified
localIncludes: aSelector on: aClass
		(self mayInclude: aClass)
			ifTrue: [
				| selectorParser |
				selectorParser := self parseSelectors: self selectors.
				 ^ selectorParser matches: aSelector asString]
			ifFalse: [^false]