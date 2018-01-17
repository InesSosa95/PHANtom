as yet unclassified
testCycleDetection
	| graph node1 node2 node3 |
	graph := AspectGraph new.
	node1 := AspectNode new
		aspect: PhMockAspect1.
	node2 := AspectNode new
		aspect: PhMockAspect2.
	node3 := AspectNode new
		aspect: PhMockAspect3.
	node1 addNode: node2.
	node1 addNode: node3.
	node3 addNode: node2.

	graph add: node1; add: node2; add: node3.
	self assert: (graph existsCycle = false).
	"add a cycle"
	node2 addNode: node3.
	self assert: (graph existsCycle = true).