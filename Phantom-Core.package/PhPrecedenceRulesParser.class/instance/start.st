parser
start
	^ (identifierStar / starIdentifierStar / starAny) end ==> [:node | self buildNodeSetFrom: node  ]