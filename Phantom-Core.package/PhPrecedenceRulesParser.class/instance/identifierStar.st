tokens
identifierStar
	^ (identifier, any optional, anysubclass optional) ==> [:node |
		| precedenceParser|
		precedenceParser := (node at: 1) asParser.
		(node at: 2) notNil ifTrue: [precedenceParser := precedenceParser, #word asParser star].
		Array with: precedenceParser with: (node at: 3)]