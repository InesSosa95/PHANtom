matching-arrays
testReceiverSelectorArray
	| pc targetSet |
	pc := PhPointcut new
		receivers: (Array with: 'Morph' with: 'BorderedMorph');
		selectors: (Array with: 'mouseEnter:' with: 'mouseDown:').
	targetSet := Set new.
	targetSet 
		add: (Array with: Morph with: #mouseEnter:);
		add: (Array with: Morph with: #mouseDown:);
		add: (Array with: BorderedMorph with: #mouseEnter:);
		add: (Array with: BorderedMorph with: #mouseDown:).
		
	self assert: (pc getPointcuts = targetSet)  
		