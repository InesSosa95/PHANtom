matching
testTwoArgumentKeywordSelectorMatch
	| set pc |
	pc := (PhPointcut new)
		receivers: 'PhPointcut';
		localSelectors: '_:_:'.
	set := Set new.
	PhPointcut localSelectors
		do: [ :sel | 
			(sel isKeyword and: [ (sel findBetweenSubstrings: ':') size = 2 ])
				ifTrue: [ set add: (Array with: PhPointcut with: sel) ] ].
	self deny: (set isEmpty).
	self assert: pc getPointcuts = set