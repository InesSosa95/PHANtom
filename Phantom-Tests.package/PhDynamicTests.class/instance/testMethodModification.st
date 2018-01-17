as yet unclassified
testMethodModification
	| asp |
	[
	asp := PhAspect new add: (PhAdvice new
		pointcut: (PhPointcut new
			receivers: 'PhMockClass';
			selectors: 'foo');
		advice: [:ctx | 'foo'];
		type: #around).
	
	asp install.
	self checkPhMockClassFoo.
	PhMockClass compile: 'foo ^''blah'' '.
	self checkPhMockClassFoo.
	] ensure: [
	asp uninstall.
	PhMockClass compile: 'foo'.]