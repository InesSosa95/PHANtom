as yet unclassified
on: aClass selector: aSelector with: aMembraneArray
	^ (super on: aClass selector: aSelector)
		membranes: aMembraneArray;
		yourself