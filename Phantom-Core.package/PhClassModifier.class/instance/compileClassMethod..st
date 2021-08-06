private
compileClassMethod: aMethodString
	modifiedClasses
		do: [ :modifiedClass | 
			modifiedClass classSide
				compile: aMethodString
				classified: '*phantom-generated-method' ]