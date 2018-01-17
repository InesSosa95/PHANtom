accessing
testMultipointcut
	| pc cm |
	pc := PhPointcut new
		receivers: #('PhMockClass' 'PhMockAspectFoo');
		selectors: #any asParser.
	
	cm := PhClassModifier new on: pc.
	cm 
		addNewInstanceVar: 'foobarVar';
		addNewInstanceMethod: 'foobarMethod ^true'.
	[cm install.
	self assert: (PhMockClass hasInstVarNamed: 'foobarVar').
	self assert: (PhMockClass methodDict includesKey: #foobarMethod).
	self assert: (PhMockClass new perform: #foobarMethod).
	self assert: (PhMockAspectFoo hasInstVarNamed: 'foobarVar').
	self assert: (PhMockAspectFoo methodDict includesKey: #foobarMethod).
	self assert: (PhMockAspectFoo new perform: #foobarMethod).] ensure: [cm uninstall]