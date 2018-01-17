parser
start
	^ (unary / anyKeyUnary  / binary / multiword) end ==> [:node |
		(node isCollection) 
			ifTrue: [
				(node size > 1) 
					ifTrue:  [| p |
						p := node reduce: [:a :b | a,b].
						p end] 
					ifFalse: [(node at: 1) end]  ]
			ifFalse: [node end] ]