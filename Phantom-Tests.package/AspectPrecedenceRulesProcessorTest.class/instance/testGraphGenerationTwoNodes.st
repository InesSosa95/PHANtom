graph-generation
testGraphGenerationTwoNodes
	| collection processor graph n1 n2 |
	processor := PhPrecedenceRulesProcessor new.
	collection := OrderedCollection new.
	n1 := AspectNode new aspect: PhMockAspect1.
	n2 := AspectNode new aspect: PhMockAspect2.
	collection add: (Set with: n1).
	collection add: (Set with: n2).
	graph := processor getGraphFrom: collection.
	self assert: (graph nodeSet size = 2).
	self assert: (graph nodeSet includes: n1).
	self assert: (graph nodeSet includes: n2).
	self assert: ((graph nodeSet like: n1) subnodes includes: n2).  