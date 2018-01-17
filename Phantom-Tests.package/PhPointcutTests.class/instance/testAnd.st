composing
testAnd
	| pc1 pc2 targetSet |
	pc1 := PhPointcut new
		receivers: 'Morph';
		selectors: 'mouseEnter:'.
		
	pc2 := PhPointcut new
		receivers: 'Morph+';
		selectors: 'mouseEnter:'.
	targetSet := Set new.
	targetSet add: (Array with: Morph with: #mouseEnter:).
	self assert: ( (pc1 & pc2) getPointcuts = targetSet )          