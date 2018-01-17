as yet unclassified
reentrancyExample
	| asp |
	[ 
	asp := PhAspect new
		add:
			((PhAdvice new)
				pointcut:
						((PhPointcut new)
								receivers: Transcript class asString;
								selectors: 'show:');
				advice: [ Transcript show: 'Showing: ' ];
				type: #before).
	asp install.
	Transcript show: 'Reentrancy'; cr. ] ensure: [ asp uninstall ]