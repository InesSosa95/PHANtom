instance creation
uninstallOnClassCategory: aString
	(Smalltalk organization listAtCategoryNamed: aString) do: [:aClassName | 
		self uninstallClass: (Smalltalk classNamed: aClassName)]