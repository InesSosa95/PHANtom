as yet unclassified
testRootDetection
	| graph n1 n2 n3 n4 n5 n6 |
	graph := AspectGraph new.
	n1 := AspectNode new aspect: PhMockAspect1. n2 := AspectNode new aspect: PhMockAspect2. n3 := AspectNode new aspect: PhMockAspect3.
	n4 := AspectNode new aspect: PhMockAspect4. n5 := AspectNode new aspect: PhMockAspect5. n6 := AspectNode new aspect: PhMockAspect6.
	n6 addNodes: (Array with: n1 with: n2 with: n3 with: n4 with: n5).
	n1 addNodes: (Array with: n2 with: n5).
	n2 addNode: n3.
	n5 addNode: n4.
	graph addAll: (Array with: n1 with: n2 with: n3 with: n4 with: n5 with: n6).
	self assert: (graph getRootNode = n6).
	              