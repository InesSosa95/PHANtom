as yet unclassified
treeExample
	| l0 l1 l2 l3 cache quota |
	[l0 := PhMembrane new pointcut: (
		PhPointcut new
			receivers: 'PhBrowserExample+';
			selectors: 'browse').
	l1 := PhMembrane new advise: l0.
	l2 := PhMembrane new advise: l1.
	l3 := PhMembrane new advise: l0.  
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
	quota registerOn: l3.  
	l0 install.
	PhBrowserExample new browse.] ensure: [l0 uninstall.]
	    