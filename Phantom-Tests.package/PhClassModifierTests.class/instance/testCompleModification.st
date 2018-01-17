as yet unclassified
testCompleModification
	| aClassModifier mock |
	[aClassModifier := PhClassModifier new on: (PhPointcut receivers: 'PhMockClass' selectors: #any asParser).
	aClassModifier
		addNewInstanceVar: 'xxxVar';
		addNewInstanceMethod: 'plusXXX
			xxxVar := self xxxVar +1';
		addNewInstanceMethod: 'xxxVar
			^ xxxVar ifNil: [xxxVar := 0]'.
	aClassModifier install.
	mock := PhMockClass new.
	self assert: (mock xxxVar = 0).
	mock plusXXX.
	self assert: (mock xxxVar = 1).] ensure: [
	aClassModifier uninstall.] 	
	