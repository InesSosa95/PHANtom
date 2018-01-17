as yet unclassified
testBinary
	| parser |
	parser := PhSelectorParser new.
	self assert: (parser matches: '*').
	self assert: (parser matches: '***').
	self assert: (parser matches: '==>').
	self assert: (parser matches: '/').
	self deny: (parser matches: '_/').
	self deny: (parser matches: '_/:').
	self deny: (parser matches: '+:').
	self deny: (parser matches: '/_').