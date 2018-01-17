as yet unclassified
testInstalledAspects
	| asp |
	asp := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhMockClass';
				selectors: 'foo');
			advice: [:ctx | 'foo'];
			type: #around).
	[asp install.
	self assert: (PhAspectWeaver installedAspects includes: asp)] ensure: [
	asp uninstall.
	self deny: (PhAspectWeaver installedAspects includes: asp)]