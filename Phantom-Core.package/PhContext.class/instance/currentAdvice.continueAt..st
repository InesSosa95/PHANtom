advices
currentAdvice: anAdviceCollection continueAt: anIndex
	self adviceDictionary at: (self adviceRunner type) put: anAdviceCollection asArray.
	"wrapper perform: ((currentAdviceGroup, 'Advice:') asSymbol) with: (adviceDictionary at: currentAdviceGroup).
	wrapper currentAdviceIndex: (anIndex -1)"
	self adviceRunner changeAdvice: anAdviceCollection continueAt: anIndex.