instance creation
installOnClass: aClass
	|someWrappers|
	someWrappers:=OrderedCollection new.
	aClass selectors do: [:aSymbol | someWrappers add: (self installOn: aClass selector: aSymbol)].
	aClass class selectors do: [:aSymbol | someWrappers add: (self installOn: aClass class selector: aSymbol)].
	^someWrappers