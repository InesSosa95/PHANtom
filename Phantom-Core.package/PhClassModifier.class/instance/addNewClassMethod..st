method-manipulation
addNewClassMethod: aMethodString
	| aSelector |
	aSelector := (RBParser parseMethod: aMethodString) selector.
	modifiedClasses do: [:class |
		(class theMetaClass allSelectors includes: aSelector)
			ifFalse: [newClassMethodDict add: (aSelector -> aMethodString)]
			ifTrue: [self error: 'method already defined']]
	"(modifiedClass theMetaClass allSelectors includes: aSelector)
		ifFalse: 	[newClassMethodDict add: (aSelector -> aMethodString)]
		ifTrue: [self error: 'method already defined']"