accessing
add: anAdvice
	anAdvice owner: self.
	self adviceCollection add: anAdvice.
	"PhAspectWeaver cleanCache."