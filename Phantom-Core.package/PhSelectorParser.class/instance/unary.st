tokens
unary
	^ (identifier, $: asParser not) token ==> [:node | node inputValue asParser]