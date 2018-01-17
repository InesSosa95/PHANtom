private
checkExistence
	modifiedClasses
		do: [ :modifiedClass | 
			newInstanceVar
				do: [ :varName | 
					(modifiedClass theNonMetaClass hasInstVarNamed: varName)
						ifTrue: [ self error: 'instance variable already defined!' ] ].
			newClassVar
				do: [ :varName | 
					(modifiedClass theNonMetaClass hasClassVarNamed: varName)
						ifTrue: [ self error: 'class variable already defined!' ] ].
			newInstanceMethodDict
				keysDo: [ :selector | 
					(modifiedClass theNonMetaClass allSelectors includes: selector)
						ifTrue: [ self error: 'instance method already defined!' ] ].
			newClassMethodDict
				keysDo: [ :selector | 
					(modifiedClass theMetaClass allSelectors includes: selector)
						ifTrue: [ self error: 'class method already defined!' ] ] ]
	"newInstanceVar do: [:varName |
		(modifiedClass theNonMetaClass hasInstVarNamed: varName) ifTrue: [self error: 'instance variable already defined!']].
	newClassVar do: [:varName |
		(modifiedClass theNonMetaClass hasClassVarNamed: varName) ifTrue: [self error: 'class variable already defined!']].
	newInstanceMethodDict keysDo: [:selector |
		(modifiedClass theNonMetaClass allSelectors includes: selector) ifTrue: [self error: 'instance method already defined!']].
	newClassMethodDict keysDo: [:selector |
		(modifiedClass theMetaClass allSelectors includes: selector) ifTrue: [self error: 'class method already defined!']]"