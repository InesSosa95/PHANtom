as yet unclassified
idToken
	^ starToken optional, nameToken, starToken optional ==> [:node |
		| pp |
		pp := (node at: 2) asParser.
		(node at: 1) notNil ifTrue: [pp := (#word asParser starGreedy: pp), pp].
		(node at: 3) notNil ifTrue: [pp := pp, #word asParser star].
		pp]