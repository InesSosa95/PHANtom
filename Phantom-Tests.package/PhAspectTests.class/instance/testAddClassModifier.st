add-remove
testAddClassModifier
| pc mod asp |
	pc := PhPointcut new
		receivers: 'PhMockClass'; 
		selectors: 'test'.
	mod := PhClassModifier new on: (PhPointcut receivers: 'PhMockClass' selectors: #any asParser).
	asp := PhAspect new.
	asp addClassModifier: mod.
	self assert: (asp classModifiers includes: mod).
	asp removeClassModifier: mod.
	self deny: (asp classModifiers includes: mod)
	