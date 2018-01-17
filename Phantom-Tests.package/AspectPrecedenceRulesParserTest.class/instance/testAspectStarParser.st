parse
testAspectStarParser
	| parser |
	parser := PhPrecedenceRulesParser new.
	self assert: (parser matches: 'AsdfAspect*').
	self deny: (parser matches: 'Asp*ect')..
	self deny: (parser matches: 'Aspect *')..

