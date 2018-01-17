as yet unclassified
testSimplePointcutAsArgument
	| pc cm |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: #any asParser.
	
	cm := PhClassModifier new on: pc.
	cm 
		addNewInstanceVar: 'foobarVar';
		addNewInstanceMethod: 'foobarMethod ^true'.
	[cm install.
	self assert: (PhMockClass hasInstVarNamed: 'foobarVar').
	self assert: (PhMockClass methodDict includesKey: #foobarMethod).
	self assert: (PhMockClass new perform: #foobarMethod)] ensure: [cm uninstall]
	
	
	