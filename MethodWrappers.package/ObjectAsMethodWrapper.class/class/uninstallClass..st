instance creation
uninstallClass: aClass
	aClass methodDict values do: [:e | (e isKindOf: self) ifTrue: [e uninstall]].
	aClass class methodDict values do: [:e | (e isKindOf: self) ifTrue: [e uninstall]].