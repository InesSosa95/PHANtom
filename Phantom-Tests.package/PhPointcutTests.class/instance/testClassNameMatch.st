matching
testClassNameMatch
	| pc targetSet |
	pc := PhPointcut new
		receivers: 'Morph';
		selectors: 'mouseEnter:'.
	targetSet := Set new.
	targetSet add: (Array with: Morph with: #mouseEnter:).
	self assert: (pc getPointcuts = targetSet).