as yet unclassified
filterMatchedClasses: aClassCollection
	"fliter classes by object hierarchy"
	| filteredCollection |
	filteredCollection := OrderedCollection withAll: aClassCollection.
	aClassCollection do: [:each |
		| subclasses |
		subclasses := each allSubclasses.
		filteredCollection := filteredCollection reject: [:class | subclasses includes: class]].
	^ filteredCollection
	