as yet unclassified
getRoots
	| rootList |
	rootList := OrderedCollection new.
	self setParents.
	self nodeSet do: [:node |
		node parents isEmpty ifTrue: [rootList add: node]].
	^rootList 