parser
start
	^ ((idToken / allToken), metaToken optional , plusToken optional) end ==> [ :node | self generateReceiverParser: node ]