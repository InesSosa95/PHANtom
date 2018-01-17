as yet unclassified
testComplexHierarchy
	| graph n1 n2 n3 n4 n5 n6 |
	graph := AspectGraph new.
	n1 := AspectNode new aspect: PhMockAspect1. n2 := AspectNode new aspect: PhMockAspect2. n3 := AspectNode new aspect: PhMockAspect3.
	n4 := AspectNode new aspect: PhMockAspect4. n5 := AspectNode new aspect: PhMockAspect5. n6 := AspectNode new aspect: PhMockAspect6.
	n6 addNodes: (Array with: n1 with: n3 with: n5).
	n1 addNodes: (Array with: n2 with: n3).
	n3 addNodes: (Array with: n2 with: n4 with: n5).
	n4 addNode: n2.
	n5 addNode: n4.    
	graph addAll: (Array with: n1 with: n2 with: n3 with: n4 with: n5 with: n6).
	"graph setPrecedence."
	graph getTopologicalSort.
	self assert: (n6 precedence < n1 precedence).
	self assert: ((n1 precedence < n2 precedence) & (n1 precedence < n3 precedence)).
	self assert: ((n3 precedence < n2 precedence) & (n3 precedence < n4 precedence) & (n3 precedence < n5 precedence)).
	self assert: (n4 precedence < n2 precedence).
	self assert: (n5 precedence < n4 precedence).