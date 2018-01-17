private
sort: anAdvicesCollection from: aSortedAspectCollection
	| sortedAdvices |
	sortedAdvices := OrderedCollection new.
	aSortedAspectCollection do: [:each |
		| col |
		col := anAdvicesCollection select: [:adv | adv owner class = each].
		col do: [:adv | sortedAdvices add: adv]].
	^sortedAdvices.