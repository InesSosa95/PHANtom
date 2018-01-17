private
parseReceivers: receiversDefinition
	^ cachedRecParser
		ifNil: [ 
			cachedRecParser := receiversDefinition isPetitParser
				ifTrue: [ receiversDefinition ]
				ifFalse: [ 
					receiversDefinition isString
						ifTrue: [ PhPointcut receviersParser parse: receiversDefinition ]
						ifFalse: [ 
							receiversDefinition size = 1
								ifTrue: [ PhPointcut receviersParser parse: (receiversDefinition at: 1) ]
								ifFalse: [ 
									receiversDefinition
										reduce: [ :a :b | 
											| parserA parserB |
											a isPetitParser
												ifTrue: [ parserA := a ]
												ifFalse: [ parserA := PhPointcut receviersParser parse: a ].
											b isPetitParser
												ifTrue: [ parserB := b ]
												ifFalse: [ parserB := PhPointcut receviersParser parse: b ].
											parserA / parserB ] ] ] ] ]