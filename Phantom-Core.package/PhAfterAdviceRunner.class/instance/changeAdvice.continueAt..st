as yet unclassified
changeAdvice: anAdviceCollection continueAt: anIndex
	super changeAdvice: anAdviceCollection continueAt: anIndex.
	self adviceGroup afterAdvice: anAdviceCollection.