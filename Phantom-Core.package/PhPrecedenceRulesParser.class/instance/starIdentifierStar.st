tokens
starIdentifierStar
	^ (any, word plus flatten, any optional, anysubclass optional) ==> [:node |
		| precedeceParser |
		precedeceParser := (#word asParser starGreedy: ((node at: 2) asParser)), (node at: 2) asParser.
		(node at: 3) notNil ifTrue: [precedeceParser := precedeceParser, #word asParser star].
		Array with: precedeceParser with: (node at: 4)]