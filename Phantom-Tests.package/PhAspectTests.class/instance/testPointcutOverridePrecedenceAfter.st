pointcut-precedence
testPointcutOverridePrecedenceAfter
	|pc aspect1 aspect2 aspect3 mock |
	mock := (PhMockClass new).
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#receiver);
		overridePrecedence: #('PhMockAspect1' 'PhMockAspect2' 'PhMockAspect3').  
	aspect1 := PhMockAspect1 new 
		add: (PhAdvice new
			pointcut: pc;
			advice: [:context | context receiver test: ('asp1', context receiver testString)];
			type: #after);
		precedence: #('PhMockAspect3' 'PhMockAspect1' 'PhMockAspect2').
	aspect2 := PhMockAspect2 new add: ( PhAdvice new 
		pointcut: pc;
		advice: [:context | context receiver test: ('asp2', context receiver testString)];
		type: #after).
	aspect3 := PhMockAspect3 new add: (PhAdvice new  
		pointcut: pc;
		advice: [:context | context receiver test: ('asp3', context receiver testString)];
		type: #after).
	
	[
	aspect1 install.
	aspect2 install.
	aspect3 install.
	mock test.
	self assert: (mock test = 'asp1asp2asp3test')] ensure: [
		aspect1 uninstall.
		aspect2 uninstall.
		aspect3 uninstall].  