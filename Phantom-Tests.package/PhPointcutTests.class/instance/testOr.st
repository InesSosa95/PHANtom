composing
testOr
	| pc1 pc2 targetSet |
	pc1 := PhPointcut new
		receivers: 'Morph';
		selectors: 'mouseEnter:'.
	pc2 := PhPointcut new
		receivers: 'OrderedCollection';
		selectors: 'add:'.
	targetSet := Set new.
	targetSet
		add: (Array with: Morph with: #mouseEnter:);
		add: (Array with: OrderedCollection with: #add:).
	self assert: ( (pc1 | pc2) getPointcuts = targetSet )            