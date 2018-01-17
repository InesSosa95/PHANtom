as yet unclassified
merge: anAspectGraph 
	anAspectGraph nodeSet do: [:node | self add: node].
	anAspectGraph nodeSet do: [:node |
		node subnodes do: [:sub |
			(self nodeSet like: node) subnodes add: (self nodeSet like: sub)]].
	^self.