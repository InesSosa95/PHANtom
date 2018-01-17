as yet unclassified
checkPhMockClassFoo
	
	self halt.
	self assert: ((SmalltalkImage current at: #PhMockClass) new foo = 'foo')