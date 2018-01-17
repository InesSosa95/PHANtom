as yet unclassified
testAddNewInstanceVar
	| aClassModifier |
	[aClassModifier := PhClassModifier new on: (PhPointcut receivers: 'PhMockClass' selectors: #any asParser).
	self deny: (PhMockClass hasInstVarNamed: 'asdf').
	aClassModifier addNewInstanceVar: 'asdf'.
	aClassModifier install.
	self assert: (PhMockClass hasInstVarNamed: 'asdf').] ensure: [
	aClassModifier uninstall.
	self deny: (PhMockClass hasInstVarNamed: 'asdf')]
	    