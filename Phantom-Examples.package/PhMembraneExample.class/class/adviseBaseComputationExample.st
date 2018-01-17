as yet unclassified
adviseBaseComputationExample
	| advisingMembrane baseMembrane asp |
	[baseMembrane := PhMembrane new
		pointcut: (PhPointcut new
			receivers: 'PhBaseExample';
			selectors: 'foo').
	advisingMembrane := PhMembrane new	advise: baseMembrane.
	baseMembrane install.
	"advisingMembrane install."
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhBaseExample';
				selectors: 'bar');
			advice: ['foo'];
			type: #around).
	asp registerOn: advisingMembrane.
	Transcript show: 'Calling bar directly...'; cr.
	Transcript show: (PhBaseExample new bar); cr.
	Transcript show: 'Calling bar from foo computation..'; cr.
	Transcript show: (PhBaseExample new foo); cr] ensure: [baseMembrane uninstall. "advisingMembrane uninstall"]  
	
	