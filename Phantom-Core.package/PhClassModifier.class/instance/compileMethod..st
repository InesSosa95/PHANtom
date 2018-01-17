private
compileMethod: aMethodString
	modifiedClasses do: [:modifiedClass |
		modifiedClass compile: aMethodString classified: '*phantom-generated-method'  ]
	