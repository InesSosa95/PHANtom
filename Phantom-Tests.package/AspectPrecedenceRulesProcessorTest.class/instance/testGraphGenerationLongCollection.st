graph-generation
testGraphGenerationLongCollection
	| collection processor graph n1 n2 n3 n4 n5 n6 |
	processor := PhPrecedenceRulesProcessor new.
	collection := OrderedCollection new.
	n1 := AspectNode new aspect: PhMockAspect1.
	n2 := AspectNode new aspect: PhMockAspect2.
	n3 := AspectNode new aspect: PhMockAspect3.
	n4 := AspectNode new aspect: PhMockAspect4.
	n5 := AspectNode new aspect: PhMockAspect5.
	n6 := AspectNode new aspect: PhMockAspect6.
	collection add: (Set with: n1).
	collection add: (Set with: n2 with: n3).
	collection add: (Set with: n4 with: n5).
	collection add: (Set with: n6).
	graph := processor getGraphFrom: collection.
	self assert: (graph nodeSet size = 6).
	self assert: (graph nodeSet includes: n1).
	self assert: (graph nodeSet includes: n2).
	self assert: (graph nodeSet includes: n3).
	self assert: (graph nodeSet includes: n4).
	self assert: (graph nodeSet includes: n5).
	self assert: (graph nodeSet includes: n6).
	self assert: ((graph nodeSet like: n1) subnodes includes: n2).
	self assert: ((graph nodeSet like: n1) subnodes includes: n3).
	self assert: ((graph nodeSet like: n2) subnodes includes: n4).
	self assert: ((graph nodeSet like: n2) subnodes includes: n5).
	self assert: ((graph nodeSet like: n3) subnodes includes: n4).
	self assert: ((graph nodeSet like: n3) subnodes includes: n5).
	self assert: ((graph nodeSet like: n4) subnodes includes: n6).
	self assert: ((graph nodeSet like: n5) subnodes includes: n6).
	self assert: ((graph nodeSet like: n1) subnodes size = 2).
	self assert: ((graph nodeSet like: n2) subnodes size = 2).
	self assert: ((graph nodeSet like: n3) subnodes size = 2).
	self assert: ((graph nodeSet like: n4) subnodes size = 1).
	self assert: ((graph nodeSet like: n5) subnodes size = 1).
	self assert: ((graph nodeSet like: n6) subnodes size = 0).