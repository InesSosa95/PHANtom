graph generation
getGraphFrom: aNodeCollection
	| graph |
	graph := AspectGraph new.
	aNodeCollection reduce: [:parents :children |
		graph addAll: parents.
		graph addAll: children.
		parents do: [:node |
			children do: [:child |
				(graph nodeSet like: node) addNode: (graph nodeSet like: child)]].
		children.].
	^graph.