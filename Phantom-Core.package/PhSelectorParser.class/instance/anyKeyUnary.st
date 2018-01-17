tokens
anyKeyUnary
	^($_ asParser, $: asParser not) ==> [:node | self identifier].