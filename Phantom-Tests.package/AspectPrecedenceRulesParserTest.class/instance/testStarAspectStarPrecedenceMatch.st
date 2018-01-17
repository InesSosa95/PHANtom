match
testStarAspectStarPrecedenceMatch
	| parser set target classes regex |
	regex := '[\w\d]*MockAspect[\w\d]*' asRegex.
	parser := PhPrecedenceRulesParser new.
	set := parser parse: '*MockAspect*'.
	classes := PhAspect allSubclasses select: [:class | regex matches: class name asString].
	target := Set new.
	classes do: [:class | target add: (AspectNode new aspect: class)].
	self assert: (set = target).