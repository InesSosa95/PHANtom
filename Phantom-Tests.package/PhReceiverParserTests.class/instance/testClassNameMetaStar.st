parserTests
testClassNameMetaStar
	| parser |
	parser := PhReceiverParser new.
	self assert: (parser matches: '*Morph class').
	self assert: (parser matches: '*Morph* class').
	self assert: (parser matches: 'Morph* class').
	self deny: (parser matches: '*Morph class*').
	self deny: (parser matches: 'Morph class*').

	