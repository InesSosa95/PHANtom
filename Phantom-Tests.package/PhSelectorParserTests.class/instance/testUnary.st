as yet unclassified
testUnary
	| parser |
	parser := PhSelectorParser new.
	self assert: (parser matches: 'foo').
	self deny: (parser matches: '1foo').
	self deny: (parser matches: '_:foo').
	self deny: (parser matches: '#foo').
	self deny: (parser matches: '*foo').