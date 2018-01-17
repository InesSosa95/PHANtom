as yet unclassified
initialize
	| methodPc constructorPc |
	super initialize.
	Trace := PhantomDemoTrace.
	methodPc := PhPointcut new
		receivers: #('PhantomDemoTwoDShape' 'PhantomDemoSquare' 'PhantomDemoCircle');
		localSelectors: #any asParser star;
		context: #(#receiver #arguments #selector).
	  
	constructorPc := PhPointcut new
		receivers: #('PhantomDemoTwoDShape class' 'PhantomDemoSquare class' 'PhantomDemoCircle class');
		localSelectors: #any asParser star;
		context: #(#receiver #arguments #selector).
		
	self add: (PhAdvice new
		pointcut: methodPc;
		advice: [:context | Trace traceEntry: (context receiver class asString), ' ', (context selector asString)];
		type: #before).
	self add: (PhAdvice new
		pointcut: methodPc;
		advice: [:context | Trace traceExit: (context receiver class asString), ' ', (context selector asString)];
		type: #after).
	self add: (PhAdvice new
		pointcut: constructorPc;
		advice: [:context | Trace traceEntry: (context receiver class asString), ' ', (context selector asString)];
		type: #before).
	self add: (PhAdvice new
		pointcut: constructorPc;
		advice: [:context | Trace traceExit: (context receiver class asString), ' ', (context selector asString)];
		type: #after).
		