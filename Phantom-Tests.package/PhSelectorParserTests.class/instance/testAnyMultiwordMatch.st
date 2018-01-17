as yet unclassified
testAnyMultiwordMatch
	| parser |
	parser := (PhSelectorParser new) parse: '_:bar:'.
	self assert: (parser matches: 'any:bar:').
	self assert: (parser matches: 'foo:bar:').
	self deny: (parser matches: 'foo:bla:hh:bar:').
	self deny: (parser matches: 'bla:foo:hh:bar:').
	self deny: (parser matches: 'bar:').
	
	  
	