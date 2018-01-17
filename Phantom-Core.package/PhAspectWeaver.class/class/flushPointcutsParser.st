update
flushPointcutsParser
	"This could be optimised so that we dont need to do an allInstances"
	PhPointcut allInstances do: [:pc| pc resetParsers].
