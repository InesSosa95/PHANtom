as yet unclassified
distance: aTwoDShape
	| dx dy |
	dx := (aTwoDShape x - x) abs.
	dy := (aTwoDShape y - y) abs.
	^((dx raisedTo: 2) + (dy raisedTo: 2)) sqrt.