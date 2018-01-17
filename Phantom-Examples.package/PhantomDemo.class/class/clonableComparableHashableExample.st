as yet unclassified
clonableComparableHashableExample
	| clonable hashable comparable |
	[| p1 p2 dict |
	"Transcript open."
	clonable := ClonablePointDemoAspect new.
	hashable := HashablePointDemoAspect new.
	comparable := ComparablePointDemoAspect new.
	
	clonable install.  
	hashable install.  
	comparable install.
	Transcript show: 'Clonable test'; cr.
	p1 := PhantomDemoPoint new.
	p1 setPolarWith: (Float pi) and: 1.0.
	p2 := p1 copy.
	Transcript show: 'p1: ', p1 asString; cr.
	Transcript show: 'p2: ', p2 asString; cr.
	p1 rotate: (Float pi / -2.0).
	Transcript show: 'p1: ', p1 asString; cr.
	Transcript show: 'p2: ', p2 asString; cr.
	Transcript show: 'Hashable test'; cr.
	p1 := PhantomDemoPoint new.
	p2 := PhantomDemoPoint new.
	p1 setRectangularWith: 10 and: 10.
	p2 setRectangularWith: 10 and: 10.
	dict := Dictionary newFrom: {p1 -> 'p1'}.
	Transcript show: 'p1: ', p1 asString; cr.
	Transcript show: 'p2: ', p2 asString; cr.
	Transcript show: 'p1: ', p1 hash asString; cr.
	Transcript show: 'p2: ', p2 hash asString; cr.
	Transcript show: ('Got: ', (dict at: p2) asString); cr.
	Transcript show: 'Comparable test'; cr.
	p1 := PhantomDemoPoint new.
	p2 := PhantomDemoPoint new.
	Transcript show: ('p1 =?= p2 : ', (p1 compareTo: p2) asString); cr.
	p1 setRectangularWith: 2 and: 5.
	p2 setRectangularWith: 2 and: 5.
	Transcript show: ('p1 =?= p2 : ', (p1 compareTo: p2) asString); cr.
	p2 setRectangularWith: 3 and: 6.
	Transcript show: ('p1 =?= p2 : ', (p1 compareTo: p2) asString); cr.
	 ] ensure: [
	clonable uninstall.
	hashable uninstall.
	comparable uninstall. ]