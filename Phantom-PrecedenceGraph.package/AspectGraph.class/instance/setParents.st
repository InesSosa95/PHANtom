as yet unclassified
setParents
	self nodeSet do: [:node 	| node clearParents].
	self nodeSet do: [:node |
		node subnodes do: [:sub |
			sub parents add: node]].