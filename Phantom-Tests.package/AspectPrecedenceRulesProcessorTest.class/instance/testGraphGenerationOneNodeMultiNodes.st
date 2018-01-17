graph-generation
testGraphGenerationOneNodeMultiNodes
	| collection processor graph n1 n2 n3 n4 |
	processor := PhPrecedenceRulesProcessor new.
	collection := OrderedCollection new.
	n1 := AspectNode new aspect: PhMockAspect1.
	n2 := AspectNode new aspect: PhMockAspect2.
	n3 := AspectNode new aspect: PhMockAspect3.
	n4 := AspectNode new aspect: PhMockAspect4.
	collection add: (Set with: n1).
	collection add: (Set with: n2 with: n3 with: n4).
	graph := processor getGraphFrom: collection.
	self assert: (graph nodeSet size = 4).
	self assert: (graph nodeSet includes: n1).
	self assert: (graph nodeSet includes: n2).
	self assert: (graph nodeSet includes: n3).
	self assert: (graph nodeSet includes: n4).
	self assert: ((graph nodeSet like: n1) subnodes includes: n2).
	self assert: ((graph nodeSet like: n1) subnodes includes: n3).
	self assert: ((graph nodeSet like: n1) subnodes includes: n4).
	self assert: ((graph nodeSet like: n1) subnodes size = 3).