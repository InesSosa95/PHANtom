tests
testClassMetaStarMatch

	| targetCol generatedCol parser |
	
	targetCol := Set new.
	targetCol addAll: Class allSubclasses.
	generatedCol := Set new.
	parser := (PhReceiverParser new) parse: '* class'.
	
	SmalltalkImage current allClasses do: [:each |
		(parser matches: each definition) ifTrue: [generatedCol add: each].
		(parser matches: each class definition) ifTrue: [generatedCol add: each class]].
	
	self assertCollection: generatedCol equals: targetCol 