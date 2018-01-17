precedence
testPrecedenceBefore
	|pc aspect1 aspect2 aspect3 |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#receiver).
	aspect1 := PhMockAspect1 new 
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver test: ('asp1', context receiver testString)];
			type: #before);
		precedence: #('PhMockAspect3' 'PhMockAspect1' 'PhMockAspect2').
	aspect2 := PhMockAspect2 new add: (PhAdvice new
		pointcut: pc;
		advice: [:context | context receiver test: ('asp2', context receiver testString)];
		type: #before).
	aspect3 := PhMockAspect3 new add: (PhAdvice new
		pointcut: pc;
		advice: [:context | context receiver test: ('asp3', context receiver testString)];
		type: #before).
	
	  
	[
	aspect1 install.
	aspect2 install.
	aspect3 install.
	self assert: ((PhMockClass new) test = 'asp2asp1asp3test')] ensure: [
		aspect1 uninstall.
		aspect2 uninstall.
		aspect3 uninstall].  