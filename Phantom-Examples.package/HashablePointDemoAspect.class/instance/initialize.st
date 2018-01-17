as yet unclassified
initialize
	super initialize.
	self
		add:
			((PhAdvice new)
				pointcut:
						((PhPointcut new)
								receivers: 'PhantomDemoPoint';
								selectors: 'hash';
								context: #(#receiver));
				send: #hash: to: self;
				type: #around).
	self
		add:
			((PhAdvice new)
				pointcut:
						((PhPointcut new)
								receivers: 'PhantomDemoPoint';
								selectors: '=';
								context: #(#receiver #arguments));
				advice: [ :context | (context receiver x = (context arguments at: 1) x & (context receiver y = (context arguments at: 1) y)) ];
				type: #around)