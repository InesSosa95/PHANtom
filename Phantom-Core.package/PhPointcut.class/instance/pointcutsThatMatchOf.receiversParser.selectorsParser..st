private
pointcutsThatMatchOf: aClassNDescs receiversParser: receiversParser selectorsParser: selectorsParser
	| aCollection aClass|
	aCollection := OrderedCollection new.
	aClass := aClassNDescs key.
	(receiversParser matches: (aClassNDescs value at: 1))
		ifTrue: [ 
			(self selectorsMessage value: aClass)
				do: [ :sel | 
					(selectorsParser matches: sel asString)
						ifTrue: [ aCollection add: (Array with: aClass with: sel) ] ] ].
	(receiversParser matches: (aClassNDescs value at: 2))
		ifTrue: [ 
			(self selectorsMessage value: aClass class)
				do: [ :sel | 
					(selectorsParser matches: sel asString)
						ifTrue: [ aCollection add: (Array with: aClass class with: sel) ] ] ].
	^ aCollection