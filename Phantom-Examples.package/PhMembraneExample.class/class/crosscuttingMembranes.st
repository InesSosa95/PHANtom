as yet unclassified
crosscuttingMembranes
	| cacheMembrane logMembrane cacheAsp logAsp pc |
	[ 
	pc := (PhPointcut new)
		receivers: 'PhBrowserExample+';
		selectors: 'get:';
		context: #(#arguments #receiver).
	cacheAsp := PhAspect new
		add:
			((PhAdvice new)
				pointcut: pc;
				advice: [ :context | 'cached: ' , context arguments asString ];
				type: #around).
	logAsp := PhAspect new
		add:
			((PhAdvice new)
				pointcut: pc;
				advice: [ :context | 
							Transcript
								show: (context receiver asString) , 'search: ' ,( context arguments asString);
								cr ];
				type: #after).
	cacheMembrane := PhMembrane new
		pointcut:
			((PhPointcut new)
				receivers: #('PhAdminBrowserExample' 'PhUserBrowserExample');
				selectors: 'get:').
	logMembrane := PhMembrane new
		pointcut:
			((PhPointcut new)
				receivers: #('PhGuestBrowserExample' 'PhUserBrowserExample');
				selectors: 'get:').
	cacheAsp registerOn: cacheMembrane.
	logAsp registerOn: logMembrane.
	logMembrane install.
	cacheMembrane install.
	Transcript
		show: 'User';
		cr.
	Transcript
		show: (PhUserBrowserExample new get: 'aUrl');
		cr.
	Transcript
		show: 'Admin';
		cr.
	Transcript
		show: (PhAdminBrowserExample new get: 'aUrl');
		cr.
	Transcript
		show: 'Guest';
		cr.
	Transcript
		show: (PhGuestBrowserExample new get: 'aUrl');
		cr ]
		ensure: [ 
			logMembrane uninstall.
			cacheMembrane uninstall ]