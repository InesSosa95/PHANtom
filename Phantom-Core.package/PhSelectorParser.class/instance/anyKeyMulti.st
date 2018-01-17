tokens
anyKeyMulti
	^($_ asParser, $: asParser) ==> [:node | self identifier, $: asParser].