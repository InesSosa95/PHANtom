tokens
binary
	^ ((PPPredicateObjectParser anyOf: '!%&*+,-/<=>?@\|~') ,
	  (PPPredicateObjectParser anyOf: '!%&*+,/<=>?@\|~') star) flatten token ==> [:node | node inputValue asParser]