private
currentSender
	| stack |
	stack := thisContext stack.
	"stack explore."
	(1 to: stack size)
		do: [ :idx | 
			(stack at: idx) receiver == self & ((stack at: idx) selector == #run:with:in:)
				ifTrue: [ 
					((stack at: idx + 1) receiver isKindOf: PhMethodWrapper) & ((stack at: idx + 1) selector == #doesNotUnderstand:)
						ifTrue: [ ^ (stack at: idx + 2) receiver ]
						ifFalse: [ ^ (stack at: idx + 1) receiver ] ] ].
	self error: 'sender not found'