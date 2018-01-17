graph-generation
testGraphMerge
	| graph1 graph2 n1g1 n2 n1g2 n3 |
	n1g1 := AspectNode new aspect: PhMockAspect1.
	n2 := AspectNode new aspect: PhMockAspect2.
	n1g2 := AspectNode new aspect: PhMockAspect1.
	n3 := AspectNode new aspect: PhMockAspect3.
	n1g1 addNode: n2.
	n1g2 addNode: n3.
	graph1 := AspectGraph new.
	graph1 addAll: (Array with: n1g1 with: n2).
	graph2 := AspectGraph new.
	graph2 addAll: (Array with: n1g2 with: n3).
	graph1 merge: graph2.
	self assert: ((graph1 nodeSet like: n1g1) subnodes includes: n2).
	self assert: ((graph1 nodeSet like: n1g1) subnodes includes: n3).
	self assert: ((graph1 nodeSet like: n1g2) subnodes includes: n2).
	self assert: ((graph1 nodeSet like: n1g2) subnodes includes: n3).     
	self assert: ((graph1 nodeSet like: n1g1) subnodes size = 2).