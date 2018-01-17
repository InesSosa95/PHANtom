advices
afterAdvice: adviceCollection
	self adviceDictionary at: #after put: adviceCollection asArray.
	self adviceRunner adviceGroup afterAdvice: (self adviceDictionary at: #after)