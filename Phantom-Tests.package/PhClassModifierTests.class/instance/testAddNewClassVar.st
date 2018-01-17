as yet unclassified
testAddNewClassVar
	| aClassModifier |
	[aClassModifier := PhClassModifier new on: (PhPointcut receivers: 'PhMockClass' selectors: #any asParser).
	self deny: (PhMockClass hasClassVarNamed: 'Asdf').
	aClassModifier addNewClassVar: 'Asdf'.
	aClassModifier install.
	self assert: (PhMockClass hasClassVarNamed: 'Asdf').] ensure: [
	aClassModifier uninstall.
	self deny: (PhMockClass hasClassVarNamed: 'Asdf')]
	    