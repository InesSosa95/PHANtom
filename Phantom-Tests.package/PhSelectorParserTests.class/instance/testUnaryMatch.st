as yet unclassified
testUnaryMatch
	| parser |
	parser := (PhSelectorParser new) parse: 'foo'.
	self assert: (parser matches: 'foo').
	self deny: (parser matches: 'foobar').
	self deny: (parser matches: 'foo:').
	self deny: (parser matches: 'bar').
	self deny: (parser matches: '*').