as yet unclassified
main
	| p1 |
	p1 := self new.
	Transcript show: 'p1 = ', p1 asString; cr.
	p1 setRectangularWith: 5 and: 2.
	Transcript show: 'p1 = ', p1 asString; cr.
	p1 setPolarWith: (Float pi / 4.0) and: 1.0.
	Transcript show: 'p1 = ', p1 asString; cr.
	p1 setPolarWith: 0.3805 and: 5.385.
	Transcript show: 'p1 = ', p1 asString; cr.