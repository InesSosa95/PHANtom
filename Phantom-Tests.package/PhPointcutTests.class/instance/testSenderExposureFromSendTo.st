context exposure
testSenderExposureFromSendTo
	| pc asp mock |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #(#sender).
	mock := PhMockClass new.
	asp := PhAspect new
		add: (PhAdvice
			around: pc
			send: #getSender: to: mock).
	[asp install.
	
	self assert: ((PhMockClass new test) = self)] ensure: [asp uninstall].    
		