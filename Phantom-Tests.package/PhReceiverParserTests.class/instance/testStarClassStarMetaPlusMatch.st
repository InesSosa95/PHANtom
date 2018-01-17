matchMetaTests
testStarClassStarMetaPlusMatch
	| targetCol generatedCol parser regex tmp |
	targetCol := Set new.
	targetCol add: Morph class.
	generatedCol := Set new.
	tmp := Set new.
	parser := (PhReceiverParser new) parse: '*Morph* class+'.
	regex := '\w*Morph\w* class' asRegex.
	SmalltalkImage current allClasses do: [:each |
		(parser matches: each definition) ifTrue: [generatedCol add: each].
		(parser matches: each class definition) ifTrue: [generatedCol add: each class].
		(regex matches: each class name asString) ifTrue: [targetCol add: each class]].
	targetCol do: [:each | tmp addAll: each allSubclasses ].
	targetCol addAll: tmp.  
	self assert: (generatedCol = targetCol)