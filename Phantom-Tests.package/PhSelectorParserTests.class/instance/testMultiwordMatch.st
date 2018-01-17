as yet unclassified
testMultiwordMatch
	| parser |
	parser := (PhSelectorParser new) parse: 'foo:'.
	self assert: (parser matches: 'foo:').
	self deny: (parser matches: 'foo').
	self deny: (parser matches: 'foo:bar:').
	self deny: (parser matches: 'foo:bar:foobar:').
	