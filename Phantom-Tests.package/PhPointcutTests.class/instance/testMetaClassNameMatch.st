matching
testMetaClassNameMatch
	| pc targetSet |
	pc := PhPointcut new
		receivers: 'Morph class';
		selectors: 'newBounds:'.
	targetSet := Set new.
	targetSet add: (Array with: (Morph class) with: #newBounds:).
	self assert: (pc getPointcuts = targetSet).