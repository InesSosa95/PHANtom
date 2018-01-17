as yet unclassified
visitInOrder: aNode
	(self visitedNodes includes: aNode) 
	ifFalse: [
		self visitedNodes add: aNode.
		aNode parents do: [:parentNode | self visitInOrder: parentNode].
		self orderedNodes add: aNode.
		]