matchMetaTests
testClassMetaMatch
	| targetCol generatedCol parser |
	targetCol := Set new.
	targetCol add: Morph class.
	generatedCol := Set new.
	parser := (PhReceiverParser new) parse: 'Morph class'.
	SmalltalkImage current allClasses do: [:each |
		(parser matches: each definition) ifTrue: [generatedCol add: each].
		(parser matches: each class definition) ifTrue: [generatedCol add: each class]].
	self assert: (generatedCol = targetCol)