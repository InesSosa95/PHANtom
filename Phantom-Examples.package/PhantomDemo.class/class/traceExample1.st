as yet unclassified
traceExample1
	| c1 c2 s1 asp |
	"Transcript open."
	PhantomDemoTrace tracelevel: 2.  
	PhantomDemoTrace initStream: (WriteStream on: '').  
	asp := TraceDemoAspect new.
	[asp install.
	c1 := PhantomDemoCircle x: 3.0 y: 3.0 r: 2.0.
	c2 := PhantomDemoCircle r: 4.0.
	s1 := PhantomDemoSquare x: 1.0 y: 2.0.
	Transcript show: 'c1 perimeter : ', (c1 perimeter asString); cr.
	Transcript show: 'c1 area : ', (c1 area asString); cr.
	Transcript show: 's1 perimeter : ', (s1 perimeter asString); cr.
	Transcript show: 's1 area : ', (s1 area asString); cr.
	Transcript show: 'c2 distance c1 : ', ((c2 distance: c1) asString); cr.
	Transcript show: 's1 distance c1 : ', ((s1 distance: c1) asString); cr.
	Transcript show: 's1 asString : ', (s1 asString); cr.
	Transcript show: asp trace traceStream contents.] ensure: [asp uninstall]  