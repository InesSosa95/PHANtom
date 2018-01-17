add-remove
testAddAdvice
| pc adv asp |
	pc := PhPointcut new
		receivers: 'PhMockClass'; 
		selectors: 'test'.
	adv := PhAdvice new
		advice: [:ctx | 'around'];
		pointcut: pc;
		type: #around.
	asp := PhAspect new.
	asp add: adv.
	self assert: (asp adviceCollection includes: adv).
	asp remove: adv.
	self deny: (asp adviceCollection includes: adv)
	