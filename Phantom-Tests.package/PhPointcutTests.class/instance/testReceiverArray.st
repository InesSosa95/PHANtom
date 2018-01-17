matching-arrays
testReceiverArray
	| pc targetSet |
	pc := PhPointcut new
		receivers: (Array with: 'Morph' with: 'BorderedMorph');
		selectors: 'mouseEnter:'.
	targetSet := Set new.
	targetSet 
		add: (Array with: Morph with: #mouseEnter:);
		add: (Array with: BorderedMorph with: #mouseEnter:).
		
	self assert: (pc getPointcuts = targetSet)  
		