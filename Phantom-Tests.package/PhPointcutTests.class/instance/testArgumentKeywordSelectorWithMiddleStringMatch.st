matching
testArgumentKeywordSelectorWithMiddleStringMatch
	| set pc |
	pc := (PhPointcut new)
		receivers: 'SequenceableCollection';
		localSelectors: '_:to:_:'.
	set := Set new.
	SequenceableCollection localSelectors
		do: [ :sel | 
			((sel isKeyword) and: [((sel findBetweenSubstrings: ':') size = 3) and: [(((sel findBetweenSubstrings: ':') at: 2) = 'to')]])
				ifTrue: [ set add: (Array with: SequenceableCollection with: sel) ] ].
	self deny: (set isEmpty).
	self assert: pc getPointcuts = set