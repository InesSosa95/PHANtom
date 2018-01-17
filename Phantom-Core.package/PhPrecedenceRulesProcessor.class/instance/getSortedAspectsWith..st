aspect sorting
getSortedAspectsWith: aRulesSet
	| graphs graph |
	(aRulesSet isEmpty) ifTrue: [^#()].
	graphs := OrderedCollection new.
	aRulesSet collect: [:rulesArray |
		| nodeCollection |
		nodeCollection := OrderedCollection new.
		rulesArray do: [:rule | nodeCollection add: (PhPrecedenceRulesParser new parse: rule)].
		"lipieza por relga *"
		rulesArray withIndexDo: [:elem :index |
			(elem = '*') ifTrue: [
				nodeCollection withIndexDo: [:col :idx |
					((rulesArray at: idx) = '*') not ifTrue: [
						nodeCollection at: index put: ((nodeCollection at: index) difference: col)]]]].
		graphs add: nodeCollection].
	graph := OrderedCollection new.
	graphs do: [:each |
		| g |
		g := self getGraphFrom: each.
		graph add: g].
	graph := graph reduce: [:a :b | a merge: b].
	(graph existsCycle) ifTrue: [self error: 'Conflict detected in rules set'].
	"graph setPrecedence.
	^ (graph nodeSet asArray sort: [:a :b | a precedence < b precedence]) collect: [:each | each aspect]."
	^ graph getTopologicalSort collect: [:node | node aspect]