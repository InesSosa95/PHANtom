PhAdvice represents a pointcut, advice pair.
Use pointcut:  to declare the joinpoint to capture, using an instance of PhPointcut.
Use type: to declare the type of the advice,
	#before
	#after
	#around.
Use advice: to add the method to execute on the captued joinpoints.
advice: accept a block or a selector, with 0 arguments (if no context is captured on the pointcut), or 1 arguments for the context captured on the joinpoint.
you can also use selector:of: to send a message on an object for advice.
Example: 
	PhAdvice new
		pointcut: aPointcut;
		type: #before;
		advice: [:context | Transcript show: context receiver asString].
		
	PhAdvice new
		pointcut: aPointcut;
		type: #around;
		selector: #theAdviceOnFoo: of: foo.  