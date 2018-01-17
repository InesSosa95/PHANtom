as yet unclassified
testMultiwordAny
	| parser |
	parser := PhSelectorParser new.
	self assert: (parser matches: '_:foo:').
	self assert: (parser matches: '_').
	self assert: (parser matches: '_:').
	self assert: (parser matches: 'foo:_:').
	self assert: (parser matches: '_:foo:_:_:bar:').
	self deny: (parser matches: '_foo:_:bar:_:').
	self deny: (parser matches: '_:foo').
	self deny: (parser matches: 'foo_:').
	self deny: (parser matches: '_foo').
	self deny: (parser matches: 'foo:_:bar').