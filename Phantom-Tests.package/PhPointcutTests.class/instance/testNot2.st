composing
testNot2
	| pc pc2 regex pcCol targetSet |
	pc := PhPointcut new
		receivers: '*Morph*';
		selectors: 'mouseEnter:'.
	pc2 := PhPointcut new
		receivers: #word asParser star , ' class' asParser;
		selectors: #any asParser star.
	regex := '\w*Morph\w*' asRegex.
	targetSet := Set new.
	(RPackageOrganizer default
		packageNamed: 'Morphic-Kernel'
		ifAbsent: nil)
		ifNotNil: [ :package | 
			package classes
				do: [ :class | 
					(regex matches: class name asString) not
						ifTrue: [ class allSelectors
								do: [ :sel | targetSet add: (Array with: class with: sel) ] ]
						ifFalse: [ class allSelectors
								do: [ :sel | 
									(sel = #mouseEnter:) not
										ifTrue: [ targetSet add: (Array with: class with: sel) ] ] ] ] ].
	pcCol := (pc not & pc2 not restrictToPackages: #('Morphic-Kernel'))
		getPointcuts.
	self assert: pcCol = targetSet