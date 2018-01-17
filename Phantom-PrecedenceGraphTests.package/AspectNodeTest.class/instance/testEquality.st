as yet unclassified
testEquality
	| n1 n2 n3 |
	n1 := AspectNode new aspect: PhMockAspect1.
	n2 := AspectNode new aspect: PhMockAspect2.
	n3 := AspectNode new aspect: PhMockAspect2.
	self assert: (n1 = n1).
	self assert: (n2 = n2).
	self assert: (n2 = n3).
	self deny: (n1 = n2).
	self deny: (n1 = n3).  