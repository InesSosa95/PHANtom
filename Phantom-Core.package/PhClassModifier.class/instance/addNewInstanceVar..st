variable-manipulation
addNewInstanceVar: anInstanceVarName
	modifiedClasses do: [:each | 
		(each hasInstVarNamed: anInstanceVarName)
			ifFalse:	[newInstanceVar add: anInstanceVarName]
			ifTrue: [self error: 'variable already defined']]
	"(modifiedClass hasInstVarNamed: anInstanceVarName) 
		ifFalse:	[newInstanceVar add: anInstanceVarName]
		ifTrue: [self error: 'variable already defined']"