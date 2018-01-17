as yet unclassified
isActiveOnContext: ctx receiver: aReceiverClass selector: aSelector
	| active |
	(self localIncludes: aSelector on: aReceiverClass )
		ifTrue: [ active := self isActiveOnContext: ctx ]
		ifFalse: [ active := false ].	"active := (self includes: aSelector on: aReceiver class) and: [self isActiveOnContext: ctx]."
	self pointcut
		ifNil: [ ^ active ]
		ifNotNil: [ 
			self composition = #intersection:
				ifTrue: [ ^ active & (self pointcut isActiveOnContext: ctx receiver: aReceiverClass selector: aSelector) ]
				ifFalse: [ ^ active | (self pointcut isActiveOnContext: ctx receiver: aReceiverClass selector: aSelector) ] ]