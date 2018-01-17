as yet unclassified
getTopologicalSort
	| visit |
	self setParents.
	visit := AspectNodeVisitor new.
	^ visit getTopologicalOrderFrom: self getBaseNodes.