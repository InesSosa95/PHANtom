as yet unclassified
getBaseNodes
	| base |
	base := OrderedCollection new.
	self setParents.
	self nodeSet do: [:node |
		node subnodes isEmpty ifTrue: [base add: node]].
	^base 