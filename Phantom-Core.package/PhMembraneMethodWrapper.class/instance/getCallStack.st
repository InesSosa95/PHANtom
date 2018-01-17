as yet unclassified
getCallStack
	cflowStack isNil ifFalse: [^ cflowStack].
	cflowStack := OrderedCollection new.
	thisContext stack
		do: [ :snd | 
			| receiver selector |
			(snd receiver isKindOf: PhMethodWrapper) & (snd selector = #run:with:in:)
				ifTrue: [ 
					receiver := snd receiver wrappedClass.
					selector := snd receiver selector ]
				ifFalse: [ 
					receiver := snd receiver class.
					selector := snd selector ].
			cflowStack add: (Array with: receiver with: selector) ].
	^ cflowStack