as yet unclassified
printIdent
	(CallDepth > 0) ifTrue: [(1 to: CallDepth) do: [:i | TraceStream nextPutAll: '	']]