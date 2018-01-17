parserTests
testClassNameStar
	| parser |
	parser := PhReceiverParser new.
	self assert: (parser matches: '*Morph').
	self assert: (parser matches: '*Morph*').
	self assert: (parser matches: 'Morph*').
	self deny: (parser matches: '*Morph *').
	self deny: (parser matches: '* Morph *').
	