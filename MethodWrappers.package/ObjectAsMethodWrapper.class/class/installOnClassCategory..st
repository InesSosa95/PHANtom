instance creation
installOnClassCategory: aString
	|someWrappers|
	someWrappers:= OrderedCollection new.
	(Smalltalk organization listAtCategoryNamed: aString) do: [:aClassName | 
		someWrappers addAll: (self installOnClass: (Smalltalk classNamed: aClassName)).
		].
	^someWrappers
	