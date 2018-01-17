matching-arrays
testSelectorArray
	| pc targetSet |
	pc := PhPointcut new
		receivers: 'Morph';
		selectors: (Array with: 'mouseEnter:' with: 'mouseDown:').
	targetSet := Set new.
	targetSet 
		add: (Array with: Morph with: #mouseEnter:);
		add: (Array with: Morph with: #mouseDown:).
		
	self assert: (pc getPointcuts = targetSet)  
		