as yet unclassified
testAddNewInstanceMethod
	| aClassModifier |
	[aClassModifier := PhClassModifier new on: (PhPointcut receivers: 'PhMockClass' selectors: #any asParser ).
	self deny: (PhMockClass theNonMetaClass localSelectors includes: #theTestMethod).  
	aClassModifier addNewInstanceMethod: 'theTestMethod
		^''success'' '.  
	aClassModifier install.
	self assert: (PhMockClass new theTestMethod = 'success').] ensure: [
	aClassModifier uninstall.
	self deny: (PhMockClass theNonMetaClass localSelectors includes: #theTestMethod).]
	    