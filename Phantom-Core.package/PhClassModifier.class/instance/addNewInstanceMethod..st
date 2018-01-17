method-manipulation
addNewInstanceMethod: aMethodString
	| aSelector |
	aSelector := (RBParser parseMethod: aMethodString) selector.
	modifiedClasses do: [:each |
		(each allSelectors includes: aSelector)
			ifFalse: [newInstanceMethodDict add: (aSelector -> aMethodString)]
			ifTrue: [self error: 'method already defined']]
	"(modifiedClass allSelectors includes: aSelector)
		ifFalse: 	[newInstanceMethodDict add: (aSelector -> aMethodString)]
		ifTrue: [self error: 'method already defined']"