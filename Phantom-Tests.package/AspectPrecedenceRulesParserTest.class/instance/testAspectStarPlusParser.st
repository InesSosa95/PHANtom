parse
testAspectStarPlusParser
	| parser |
	parser := PhPrecedenceRulesParser new.
	self assert: (parser matches: 'AsdfAspect*+').
	self deny: (parser matches: 'Aspect+*')..
	self deny: (parser matches: 'Aspect *+')..