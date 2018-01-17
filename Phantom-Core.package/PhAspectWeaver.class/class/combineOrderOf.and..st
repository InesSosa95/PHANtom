private
combineOrderOf: aSortedAdvicesCollection and: anotherSortedAdviceCollection
	| combinedCollection rest |
	combinedCollection := OrderedCollection new.
	rest := OrderedCollection new.
	combinedCollection addAll: aSortedAdvicesCollection.
	anotherSortedAdviceCollection reverseDo: [:each |
		(combinedCollection includes: each) 
			ifTrue: [	rest do: [:adv | combinedCollection add: adv after: each]. rest removeAll]
			ifFalse: [rest addFirst: each]].
	combinedCollection addAllFirst: rest.
	^combinedCollection  