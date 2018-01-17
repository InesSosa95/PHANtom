advices
beforeAdvice: adviceCollection
	self adviceDictionary at: #before put: adviceCollection asArray.
	self adviceRunner adviceGroup beforeAdvice: (self adviceDictionary at: #before)  