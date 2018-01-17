variable-manipulation
addNewClassVar: aClassVarName
	| varName |
	varName := aClassVarName capitalized.
	modifiedClasses do: [:class |
		(class hasClassVarNamed: varName)
			ifFalse: [newClassVar add: varName]
			ifTrue: [self error: 'variable already defined']]
	"(modifiedClass hasClassVarNamed: varName) 
		ifFalse:	[newClassVar add: varName]
		ifTrue: [self error: 'variable already defined']"