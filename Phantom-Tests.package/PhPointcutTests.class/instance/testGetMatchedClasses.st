matching
testGetMatchedClasses
	| pc |
	pc := PhPointcut new
		receivers: 'PhMockAspectFoo+';
		selectors: #any asParser.
	self assert: (pc getMatchedClasses asSet = PhMockAspectFoo withAllSubclasses asSet).