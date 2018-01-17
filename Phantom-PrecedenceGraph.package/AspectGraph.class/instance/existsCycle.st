as yet unclassified
existsCycle
	self nodeSet do: [:node |
		| visitor |
		visitor := AspectNodeVisitor new.
		visitor detectCycleFrom: node.
		(visitor cycledDetected) ifTrue: [
			^true]].
	^false.