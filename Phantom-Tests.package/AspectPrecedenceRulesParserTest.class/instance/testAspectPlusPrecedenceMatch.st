match
testAspectPlusPrecedenceMatch
	| parser target  set classes |
	parser := PhPrecedenceRulesParser new.
	set := parser parse: 'PhMockAspectFoo+'.
	classes := PhMockAspectFoo allSubclasses.
	target := Set new.
	target add: (AspectNode new aspect: PhMockAspectFoo).
	classes do: [:each | target add: (AspectNode new aspect: each)].
	self assert: (set = target)