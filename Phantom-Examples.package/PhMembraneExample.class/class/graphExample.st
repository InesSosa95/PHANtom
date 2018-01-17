as yet unclassified
graphExample
	| l0 l1 l2 cache quota |
	[l0 := PhMembrane new pointcut: (
		PhPointcut new
			receivers: 'PhBrowserExample+';
			selectors: 'browse').
	l1 := PhMembrane new advise: l0.
	l2 := PhMembrane new advise: l0.
	l2 advise: l1.
	cache := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhBrowserExample+';
				selectors: 'getUrl:');
			advice: [Transcript show: 'Cache';cr.
					PhDiskAccessorExample new accessDisk];
			type: #before).
	quota := PhAspect new
		add: (PhAdvice new
			pointcut: (PhPointcut new
				receivers: 'PhDiskAccessorExample';
				selectors: 'accessDisk');
			advice: [Transcript show: 'Quota';cr];
			type: #before).
	cache registerOn: l1.
	quota registerOn: l2.
	l0 install.
	PhBrowserExample new browse.] ensure: [l0 uninstall.]
	    