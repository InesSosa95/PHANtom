as yet unclassified
initialize
	super initialize.
	self add:  ((PhAdvice new)
					pointcut: ((PhPointcut new)
						receivers: 'PhantomDemoPoint';
						selectors: 'postCopy';
						context: #(#receiver));
					advice: [ :context | 
						context receiver makeRectangular.
						context receiver makePolar ];
					type: #before)