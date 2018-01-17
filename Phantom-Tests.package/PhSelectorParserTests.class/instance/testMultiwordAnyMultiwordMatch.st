as yet unclassified
testMultiwordAnyMultiwordMatch
	| parser |
	parser := (PhSelectorParser new) parse: 'foo:_:bar:'.
	self assert: (parser matches: 'foo:any:bar:').
	self assert: (parser matches: 'foo:bla:bar:').
	self deny: (parser matches: 'foo:bla:hh:bar:').
	self deny: (parser matches: 'foo:bar:').
	self deny: (parser matches: 'bla:foo:hh:bar:').
	
	  
	