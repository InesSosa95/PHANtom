tokens
keyword
	^ (identifier , $: asParser) token ==> [:node | node inputValue asParser].