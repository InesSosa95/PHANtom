install-uninstall
install
	modifiedClasses := self
		filterMatchedClasses: self pointcut getMatchedClasses.
	self checkExistence.
	modifiedClasses
		do: [ :modifiedClass | 
			newInstanceVar
				do: [ :varName | modifiedClass instanceSide addInstVarNamed: varName ].
			newClassVar
				do: [ :varName | modifiedClass instanceSide addClassVarNamed: varName ].
			newClassMethodDict
				do: [ :methodString | self compileClassMethod: methodString ].
			newInstanceMethodDict
				do: [ :methodString | self compileMethod: methodString ] ]