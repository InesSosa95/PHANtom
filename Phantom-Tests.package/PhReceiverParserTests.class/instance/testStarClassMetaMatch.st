matchMetaTests
testStarClassMetaMatch
	| targetCol generatedCol parser regex |
	targetCol := Set new.
	targetCol add: Morph class.
	generatedCol := Set new.
	parser := (PhReceiverParser new) parse: '*Morph class'.
	regex := '\w*Morph class' asRegex.
	SmalltalkImage current allClasses do: [:each |
		(parser matches: each definition) ifTrue: [generatedCol add: each].
		(parser matches: each class definition) ifTrue: [generatedCol add: each class].
		(regex matches: each class name asString) ifTrue: [targetCol add: each class]].
	self assert: (generatedCol = targetCol)