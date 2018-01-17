as yet unclassified
testInstalledMembranes
	| membrane |
	membrane := PhMembrane new
		pointcut: (PhPointcut new
			receivers: 'PhMockClass';
			selectors: 'foo').
	[membrane install.
	self assert: (PhAspectWeaver installedMembranes includes: membrane)] ensure: [
	membrane uninstall.
	self deny: (PhAspectWeaver installedMembranes includes: membrane)]