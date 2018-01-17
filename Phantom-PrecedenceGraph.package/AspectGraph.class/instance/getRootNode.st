as yet unclassified
getRootNode
	self setParents.
	self nodeSet do: [:node |
		node parents isEmpty ifTrue: [^node]].