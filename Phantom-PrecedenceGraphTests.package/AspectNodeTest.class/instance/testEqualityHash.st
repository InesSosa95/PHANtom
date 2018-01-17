as yet unclassified
testEqualityHash
	| n1 n2 n3 |
	n1 := AspectNode new aspect: PhMockAspect1.
	n2 := AspectNode new aspect: PhMockAspect2.
	n3 := AspectNode new aspect: PhMockAspect2.
	self assert: (n1 hash = n1 hash).
	self assert: (n2 hash = n2 hash).
	self assert: (n2 hash = n3 hash).
	self deny: (n1 hash = n2 hash).
	self deny: (n1 hash = n3 hash).  