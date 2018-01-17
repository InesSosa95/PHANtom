accessing
remove: anAdvice
	self adviceCollection remove: anAdvice.
	"PhAspectWeaver cleanCache"