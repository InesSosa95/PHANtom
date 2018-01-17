visiting
detectCycleFrom: anAspectNode 
	(self visitedNodes includes: anAspectNode)
		ifTrue: [cycle := true]
		ifFalse: [
			self visitedNodes add: anAspectNode.
			anAspectNode subnodes do: [:node | self detectCycleFrom: node].
			self visitedNodes remove: anAspectNode].