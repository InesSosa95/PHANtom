accessing
getMatchedClasses
	^ (self getPointcuts collect: [:pair | pair at: 1]) asOrderedCollection.