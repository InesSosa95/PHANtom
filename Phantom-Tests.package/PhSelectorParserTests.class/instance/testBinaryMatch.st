as yet unclassified
testBinaryMatch
	| parser |
	parser := (PhSelectorParser new) parse: '*'.
	self assert: (parser matches: '*').
	self deny: (parser matches: '**').
	self deny: (parser matches: '***').
	self deny: (parser matches: '=>').
	self deny: (parser matches: 'foo').
	self deny: (parser matches: 'foo:').
	
	
	