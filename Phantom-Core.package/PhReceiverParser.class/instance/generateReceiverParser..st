class parser generation
generateReceiverParser: aParseNode
	^ (aParseNode at: 2) notNil
		ifTrue: [ self generateReceiverMetaclassParser: aParseNode ]
		ifFalse: [ self generateReceiverClassParser: aParseNode ]