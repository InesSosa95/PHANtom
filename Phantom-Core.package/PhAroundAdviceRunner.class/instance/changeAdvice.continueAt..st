as yet unclassified
changeAdvice: anAdviceCollection continueAt:  anIndex
	super changeAdvice: anAdviceCollection continueAt: anIndex.
	self adviceGroup aroundAdvice: anAdviceCollection.