matching
testUnarySelectorMatch
	| set pc |
	pc := (PhPointcut new)
		receivers: 'PhPointcut';
		localSelectors: '_'.
	set := Set new.
	PhPointcut localSelectors
		do: [ :sel | 
			sel isUnary
				ifTrue: [ set add: (Array with: PhPointcut with: sel) ] ].
	self deny: (set isEmpty).
	self assert: pc getPointcuts = set