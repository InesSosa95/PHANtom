node set generation
buildNodeSetFrom: aParserNode
	| aSet |
	aSet := Set new.
	((aParserNode at: 1) matches: (PhAspect name asString)) ifTrue: [aSet add: PhAspect].
	PhAspect allSubclasses do: [:asp |
		((aParserNode at: 1) matches: (asp name asString)) ifTrue: [aSet add: asp]].
	(aParserNode at: 2) notNil ifTrue: [
		| subs |
		subs := Set new.
		aSet do: [:asp | asp allSubclasses do: [:sub | subs add: sub]].
		subs do: [:asp | aSet add: asp.]].
	^aSet collect: [:asp | AspectNode new aspect: asp].