match
testAspectStarPrecedenceMatch
	| parser set target classes regex |
	regex := 'PhAspectTest.*' asRegex.
	parser := PhPrecedenceRulesParser new.
	set := parser parse: 'PhAspectTest*'.
	classes := PhAspect allSubclasses select: [:class | regex matches: class name asString].
	target := Set new.
	classes do: [:class | target add: (AspectNode new aspect: class)].
	self assert: (set = target).