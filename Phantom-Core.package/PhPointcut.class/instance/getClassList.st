private
getClassList
	self packageRestriction isEmpty
		ifTrue: [ ^ PhPointcut memoizedcd ]
		ifFalse: [ 
			| classes |
			classes := Set new.
			self packageRestriction
				do: [ :packageName | 
					| package |
					package := RPackageOrganizer default packageNamed: packageName ifAbsent: nil.
					package ifNotNil: [ classes addAll: (package classes select: [ :cl | (cl isKindOf: Trait) not ]) ] ].
			^ classes collect: [:cl | cl -> ({cl definition . cl class definition})]]