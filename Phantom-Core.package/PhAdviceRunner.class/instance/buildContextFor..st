private
buildContextFor: anAdvice
	| aContext contextExp buildAdviceContext |
	anAdvice pointcut context isEmpty
		& anAdvice pointcut dynamicContextBlock isNil
		ifTrue: [ ^ nil ].
	contextExp := anAdvice pointcut context
		collect: [ :each | 
			each = #proceed
				ifTrue: [ #method ]
				ifFalse: [ each ] ].
	buildAdviceContext := contextExp includes: #advice.
	aContext := PhContext new.
	buildAdviceContext
		ifTrue: [ contextExp := contextExp select: [ :each | (each = #advice) not ].
			self buildAdviceGroupFor: aContext ].
	contextExp
		do: [ :each | 
			aContext
				perform: (each asString , ':') asSymbol
				with: (self perform: each asSymbol) ].
	(contextExp includes: #method)
		ifTrue: [ aContext arguments: self arguments.
			aContext receiver: self receiver.
			aContext selector: self selector ].
	anAdvice pointcut dynamicContextBlock
		ifNotNil: [ :block | block value: aContext value: thisContext ].
	aContext adviceRunner: self.
	^ aContext