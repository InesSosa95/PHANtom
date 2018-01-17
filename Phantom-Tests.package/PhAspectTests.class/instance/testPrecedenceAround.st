precedence
testPrecedenceAround
	|pc aspect1 aspect2 aspect3 |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(proceed).
	aspect1 := PhMockAspect1 new 
		add: (PhAdvice new  
			pointcut: pc;
			advice: [:ctx | 'asp1',ctx proceed.];
			type: #around);
		precedence: #('PhMockAspect3' 'PhMockAspect1' 'PhMockAspect2').
	aspect2 := PhMockAspect2 new add: (PhAdvice new  
		pointcut: pc;
		advice: [:ctx | 'asp2'];
		type: #around).
	aspect3 := PhMockAspect3 new add: (PhAdvice new
		pointcut: pc;
		advice: [:ctx | 'asp3',ctx proceed];
		type: #around).
		
	
	[
	aspect1 install.
	aspect2 install.
	aspect3 install.
	self assert: ((PhMockClass new) test = 'asp3asp1asp2')] ensure: [
		aspect1 uninstall.
		aspect2 uninstall.
		aspect3 uninstall].  