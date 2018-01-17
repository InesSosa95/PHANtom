as yet unclassified
testMembraneMethodWrapperDictionary
	| membrane wrappers targetClass targetSelectors |
	membrane := PhMembrane new
		pointcut:
			(PhPointcut new
				receivers: 'PhMockClass';
				selectors: #('foo' 'test' 'bar')).
	[membrane install.
	wrappers := PhAspectWeaver classVarNamed: 'WrapperList'.
	self assert: wrappers size = 3.
	self assert: (wrappers includesKey: (Array with: PhMockClass with: #foo)).
	self assert: (wrappers includesKey: (Array with: PhMockClass with: #test)).
	self assert: (wrappers includesKey: (Array with: PhMockClass with: #bar)) ] ensure: [ membrane uninstall ]