accessing
testPointcutWithSubclasses
	| pc cm |
	pc := PhPointcut new
		receivers: #('PhMockClass+' 'PhMockAspectFoo+');
		selectors: #any asParser.
	
	cm := PhClassModifier new on: pc.
	cm 
		addNewInstanceVar: 'foobarVar';
		addNewInstanceMethod: 'foobarMethod ^true'.
	[cm install.
	self assert: (PhMockClass hasInstVarNamed: 'foobarVar').
	self assert: (PhMockClass methodDict includesKey: #foobarMethod).
	self assert: (PhMockClass new perform: #foobarMethod).
	self assert: (PhMockSubclass allSelectors includes: #foobarMethod).
	self assert: (PhMockSubclass new perform: #foobarMethod).
	self assert: (PhMockAspectFoo hasInstVarNamed: 'foobarVar').
	self assert: (PhMockAspectFoo methodDict includesKey: #foobarMethod).
	self assert: (PhMockAspectFoo new perform: #foobarMethod).
	self assert: (PhMockFooAspect5 allSelectors includes: #foobarMethod).
	self assert: (PhMockFooAspect5 new perform: #foobarMethod).] ensure: [cm uninstall]
	
	
	