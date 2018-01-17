as yet unclassified
testAnyMatch
	| parser |
	parser := (PhSelectorParser new) parse: '_'.
	self assert: (parser matches: 'bar').
	self assert: (parser matches: 'foobar').
	self deny: (parser matches: 'foobar:').
	self deny: (parser matches: 'foo:bla:hh:bar:').
	self deny: (parser matches: 'foo:bar:').
	self deny: (parser matches: 'bla:foo:hh:bar:').
	self deny: (parser matches: 'bar:').
	
	  
	