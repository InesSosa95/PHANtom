install-uninstall
uninstall
	modifiedClasses
		do: [ :modifiedClass | 
			newClassMethodDict keysDo: [ :selector | modifiedClass theMetaClass removeSelector: selector ].
			newInstanceMethodDict keysDo: [ :selector | modifiedClass theNonMetaClass removeSelector: selector ].
			modifiedClass organization removeEmptyCategories.
			modifiedClass theMetaClass organization removeEmptyCategories.
			newClassVar do: [ :classVarName | modifiedClass theNonMetaClass removeClassVarNamed: classVarName ].
			newInstanceVar do: [ :instanceVarName | modifiedClass theNonMetaClass removeInstVarNamed: instanceVarName ] ]