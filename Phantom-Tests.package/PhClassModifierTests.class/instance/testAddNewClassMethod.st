as yet unclassified
testAddNewClassMethod
	| aClassModifier |
	[ aClassModifier := PhClassModifier new
		on: (PhPointcut receivers: 'PhMockClass' selectors: #any asParser).
	self
		deny: (PhMockClass classSide localSelectors includes: #theTestMethod).
	aClassModifier
		addNewClassMethod:
			'theTestMethod
		^''success'' '.
	aClassModifier install.
	self assert: PhMockClass theTestMethod = 'success' ]
		ensure: [ aClassModifier uninstall.
			self
				deny: (PhMockClass classSide localSelectors includes: #theTestMethod) ]