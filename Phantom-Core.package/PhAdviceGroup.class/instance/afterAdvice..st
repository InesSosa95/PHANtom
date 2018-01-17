accessing
afterAdvice: anAdviceCollection
	afterAdvice := anAdviceCollection.
	afterAdvice do: [:each | each type: #after]