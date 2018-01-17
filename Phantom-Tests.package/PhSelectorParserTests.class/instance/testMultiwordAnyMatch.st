as yet unclassified
testMultiwordAnyMatch
	| parser |
	parser := (PhSelectorParser new) parse: 'bar:_:'.
	self assert: (parser matches: 'bar:foo:').
	self assert: (parser matches: 'bar:bla:').
	self deny: (parser matches: 'foo:bla:hh:bar:').
	self deny: (parser matches: 'foo:bar:').
	self deny: (parser matches: 'bla:foo:hh:bar:').
	self deny: (parser matches: 'bar:').
	
	  
	