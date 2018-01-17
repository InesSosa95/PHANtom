parse
testAspectParser
	| parser |
	parser := PhPrecedenceRulesParser new.
	self assert: (parser matches: 'AsdfAspect').
	self assert: (parser matches: '*').
	self deny: (parser matches: '*+').
	self deny: (parser matches: '+*').
	self deny: (parser matches: '+').
	self deny: (parser matches: '1Aspect').
	self deny: (parser matches: 'Asp ect').