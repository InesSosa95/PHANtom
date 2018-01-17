accessing
IncreasePrecedence
	precedence := precedence  + 1.
	self subnodes do: [:node | node IncreasePrecedence]