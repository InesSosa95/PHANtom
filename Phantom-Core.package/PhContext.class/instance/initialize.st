initialize-release
initialize
	super initialize.
	dynamicContext := Dictionary new.
	adviceDictionary := Dictionary	newFrom: {
		#before -> nil.
		#after -> nil.
		#around -> nil}