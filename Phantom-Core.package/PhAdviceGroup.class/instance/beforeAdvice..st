accessing
beforeAdvice: anAdviceCollection
	beforeAdvice := anAdviceCollection.
	beforeAdvice do: [:each | each type: #before]