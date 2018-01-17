initialize-release
init
	|plus|
	plus := PhPointcut receivers: 'PhMockClass' selectors: 'plus' context: #(receiver).

	self add: (PhAdvice after: plus
		advice: [:ctx | (ctx receiver = self target) ifFalse: [self target counter: (self target counter +1) ]] ).
	self install. 