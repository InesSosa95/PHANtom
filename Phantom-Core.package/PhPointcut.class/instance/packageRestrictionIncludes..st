accessing
packageRestrictionIncludes: aClass
	self packageRestriction isEmpty
		ifTrue: [ ^ true ]
		ifFalse: [ 
			self packageRestriction
				do: [ :packageName | 
					| package |
					package := PackageOrganizer default packageNamed: packageName ifAbsent: nil.
					package
						ifNotNil: [ 
							(package includesClass: aClass)
								ifTrue: [ ^ true ] ] ].
			^ false ]