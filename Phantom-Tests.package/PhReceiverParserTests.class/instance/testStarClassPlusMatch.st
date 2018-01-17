matchTests
testStarClassPlusMatch
	| targetCol generatedCol parser regex tmp |
	regex := '\w*Morph' asRegex.
	targetCol := Set new.
	generatedCol := Set new.
	tmp := Set new.
	parser := (PhReceiverParser new) parse: '*Morph+'.
	SmalltalkImage current allClasses do: [:each |
		(parser matches: each definition) ifTrue: [generatedCol add: each].
		(regex matches: each name asString) ifTrue: [targetCol add: each].
		(parser matches: each class definition) ifTrue: [generatedCol add: each class]].
	targetCol do: [:each | tmp addAll: each allSubclasses ].
	targetCol addAll: tmp.  
	self assert: (generatedCol = targetCol)