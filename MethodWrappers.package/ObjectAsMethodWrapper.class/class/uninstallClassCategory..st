instance creation
uninstallClassCategory: aString
	(Smalltalk organization listAtCategoryNamed: aString) do: [:aClassName | 
		self uninstallClass: (Smalltalk classNamed: aClassName)]