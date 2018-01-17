as yet unclassified
getTopologicalOrderFrom: rootNodes
	rootNodes do: [:node | self visitInOrder: node].
	self orderedNodes withIndexDo: [:node :index | node precedence: index].
	^ self orderedNodes