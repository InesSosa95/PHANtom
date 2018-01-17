parse
testAspectPlusParser
	| parser |
	parser := PhPrecedenceRulesParser new.
	self assert: (parser matches: 'AsdfAspect+').
	self deny: (parser matches: '+Aspect').
	self deny: (parser matches: 'Foo+Aspect').
	self deny: (parser matches: '+aspect').
	self deny: (parser matches: '+').