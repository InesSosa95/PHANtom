as yet unclassified
testMultiword
	| parser |
	parser := PhSelectorParser new.
	self assert: (parser matches: 'foo:').
	self assert: (parser matches: 'foo:bar:').
	self assert: (parser matches: 'foo:bar:foobar:').
	self deny: (parser matches: '1foo:').
	self deny: (parser matches: 'foo:bar').
	self deny: (parser matches: 'foo:+bar:').
	