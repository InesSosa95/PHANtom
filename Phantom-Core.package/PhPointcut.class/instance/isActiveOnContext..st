as yet unclassified
isActiveOnContext: ctx
	^ self ifBlock ifNil: [true] ifNotNil: [self ifBlock value: ctx].
	"pointcut
		ifNil: [^active]
		ifNotNil: [
			self composition = #intersection:
				ifTrue: [^ active & (pointcut isActiveOnContext: ctx)]
				ifFalse: [^ active | (pointcut isActiveOnContext: ctx)]]"