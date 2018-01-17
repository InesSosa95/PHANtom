matching
testOneArgumentKeywordSelectorMatch
	| set pc |
	pc := (PhPointcut new)
		receivers: 'PhPointcut';
		localSelectors: '_:'.
	set := Set new.
	PhPointcut localSelectors
		do: [ :sel | 
			(sel isKeyword and: [ (sel findBetweenSubstrings: ':') size = 1 ])
				ifTrue: [ set add: (Array with: PhPointcut with: sel) ] ].
	self deny: (set isEmpty).
	self assert: pc getPointcuts = set