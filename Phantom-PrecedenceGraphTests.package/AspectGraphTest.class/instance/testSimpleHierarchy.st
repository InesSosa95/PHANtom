as yet unclassified
testSimpleHierarchy
	| graph n1 n2 n3 n4 |
	graph := AspectGraph new.
	n1 := AspectNode new aspect: PhMockAspect1.
	n2 := AspectNode new aspect: PhMockAspect2.
	n3 := AspectNode new aspect: PhMockAspect3.
	n4 := AspectNode new aspect: PhMockAspect4. 
	n1 addNodes: (Array with: n2 with: n3).
	n2 addNode: n4.
	graph addAll: (Array with: n1 with: n2 with: n3 with: n4).
	"graph setPrecedence."
	graph getTopologicalSort.
	self assert: ((n1 precedence < n2 precedence) & (n1 precedence < n3 precedence)).
	self assert: (n2 precedence < n4 precedence).