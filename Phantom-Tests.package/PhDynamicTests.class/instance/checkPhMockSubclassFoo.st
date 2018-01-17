as yet unclassified
checkPhMockSubclassFoo
	self assert: ((SmalltalkImage current at: #PhMockSubclass) new foo = 'foo')