install-uninstall
install
	modifiedClasses := self filterMatchedClasses: self pointcut getMatchedClasses.
	self checkExistence.
	modifiedClasses
		do: [ :modifiedClass | 
			newInstanceVar do: [ :varName | modifiedClass theNonMetaClass addInstVarNamed: varName ].
			newClassVar do: [ :varName | modifiedClass theNonMetaClass addClassVarNamed: varName ].
			newClassMethodDict do: [ :methodString | self compileClassMethod: methodString ].
			newInstanceMethodDict do: [ :methodString | self compileMethod: methodString ] ]