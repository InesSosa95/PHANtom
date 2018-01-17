match
testStarAspectPrecedenceMatch
	| parser set target classes regex |
	regex := '\w*MockAspect1' asRegex.
	parser := PhPrecedenceRulesParser new.
	set := parser parse: '*MockAspect1'.
	classes := PhAspect allSubclasses select: [:class | regex matches: class name asString].
	target := Set new.
	classes do: [:class | target add: (AspectNode new aspect: class)].
	self assert: (set = target).