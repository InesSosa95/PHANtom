parserTests
testClassName
	| parser |
	parser := PhReceiverParser new.
	self assert: (parser matches: 'Morph').
	self assert: (parser matches: 'Morph class').
	self deny: (parser matches: '1Morph').
	self deny: (parser matches: ' Morph').
	self deny: (parser matches: 'Mor ph').
	self deny: (parser matches: 'Morph foo').
	