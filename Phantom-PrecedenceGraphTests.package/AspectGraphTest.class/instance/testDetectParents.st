as yet unclassified
testDetectParents
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
	graph setParents.
	self assert: (n1 parents size = 1).
	self assert: (n1 parents includes: n6).
	self assert: (n2 parents size = 3).
	self assert: ((n2 parents includes: n1) & (n2 parents includes: n3) & (n2 parents includes: n4)).
	self assert: (n3 parents size = 2).
	self assert: ((n3 parents includes: n6) & (n3 parents includes: n1)).
	self assert: (n4 parents size = 2).
	self assert: ((n4 parents includes: n3) & (n4 parents includes: n5)).
	self assert: (n5 parents size = 2).
	self assert: ((n5 parents includes: n3) & (n5 parents includes: n6)).
	self assert: (n6 parents size = 0)      