as yet unclassified
createPointcutList
	| aSet classes receiversParser selectorsParser |
	self memoizedpc isNil
		ifFalse: [ ^ self memoizedpc ].
	aSet := Set new.
	receiversParser := self parseReceivers: self receivers.
	selectorsParser := self parseSelectors: self selectors.
	self getClassList
		do: [ :each | aSet addAll: (self pointcutsThatMatchOf: each receiversParser: receiversParser selectorsParser: selectorsParser) ].
	self memoizedpc: aSet.
	^ aSet