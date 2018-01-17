as yet unclassified
testOneNodeCycleDetection
	| graph node1|
	graph := AspectGraph new.
	node1 := AspectNode new aspect: PhMockAspect1.
	node1 addNode: node1.
	graph add: node1.
	self assert: (graph existsCycle = true).