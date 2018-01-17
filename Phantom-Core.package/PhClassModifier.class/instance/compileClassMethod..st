private
compileClassMethod: aMethodString
	modifiedClasses do: [:modifiedClass |
		modifiedClass theMetaClass compile: aMethodString classified: '*phantom-generated-method']
	