inherited-precedence
testInheritedPrecedence
	| asp1 asp2 asp3 asp4 asp5 asp6 pc |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#receiver).
	asp1 := PhAspect new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver test: 'asp1'];
			type: #before).
	asp2 := PhMockAspect1 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver test: (context receiver testString), 'asp2'];
			type: #before).
	asp3 := PhMockAspectFoo1 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver test: (context receiver testString), 'asp3'];
			type: #before).
	asp4 := PhMockFooAspect4 new
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver test: (context receiver testString), 'asp4'];
			type: #before).
			
	  
	[
	asp4 install.
	asp3 install.
	asp2 install.
	asp1 install.
	self assert: (PhMockClass new test = 'asp1asp2asp3asp4')] ensure: [
	asp1 uninstall.
	asp2 uninstall.
	asp3 uninstall.
	asp4 uninstall.]