private
parseSelectors: selectorsDefinition
	^ cachedSelParser
		ifNil: [ 
			cachedSelParser := selectorsDefinition isPetitParser
				ifTrue: [ selectorsDefinition ]
				ifFalse: [ 
					selectorsDefinition isString
						ifTrue: [ PhPointcut selectorsParser parse: selectorsDefinition ]
						ifFalse: [ 
							selectorsDefinition size = 1
								ifTrue: [ PhPointcut selectorsParser parse: (selectorsDefinition at: 1) asString ]
								ifFalse: [ 
									selectorsDefinition
										reduce: [ :a :b | 
											| pa pb |
											a isPetitParser
												ifTrue: [ pa := a ]
												ifFalse: [ pa := PhPointcut selectorsParser parse: a ].
											b isPetitParser
												ifTrue: [ pb := b ]
												ifFalse: [ pb := PhPointcut selectorsParser parse: b ].
											pa / pb ] ] ] ] ]	"| receiversList sel |
	receiversList := self expandReceivers.
	sel := (selectorsString subStrings: ' ') collect: [:e | e asSymbol].
	^ receiversList collect: [:r | sel]"