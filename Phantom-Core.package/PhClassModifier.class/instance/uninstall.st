install-uninstall
uninstall
	modifiedClasses
		do: [ :modifiedClass | 
			newClassMethodDict
				keysDo: [ :selector | modifiedClass classSide removeSelector: selector ].
			newInstanceMethodDict
				keysDo: [ :selector | modifiedClass instanceSide removeSelector: selector ].
			modifiedClass organization removeEmptyCategories.
			modifiedClass classSide organization removeEmptyCategories.
			newClassVar
				do:
					[ :classVarName | modifiedClass instanceSide removeClassVarNamed: classVarName ].
			newInstanceVar
				do:
					[ :instanceVarName | modifiedClass instanceSide removeInstVarNamed: instanceVarName ] ]