private
pointcutsThatDontMatchOf: aClassNDescs receiversParser: receiversParser selectorsParser: selectorsParser
	| aCollection aClass|
	aClass := aClassNDescs key.
	aCollection := OrderedCollection new.
	(receiversParser matches: (aClassNDescs value at: 1)) not
		ifTrue: [ (self selectorsMessage value: aClass) do: [ :sel | aCollection add: (Array with: aClass with: sel) ] ]
		ifFalse: [ 
			(self selectorsMessage value: aClass)
				do: [ :sel | 
					(selectorsParser matches: sel asString) not
						ifTrue: [ aCollection add: (Array with: aClass with: sel) ] ].
			(self selectorsMessage = #localSelectors)
				ifTrue: [
					(aClass allSelectors difference: (aClass localSelectors)) do: [:each | aCollection add: (Array with: aClass with: each)] ] ].
	(receiversParser matches: (aClassNDescs value at: 2)) not
		ifTrue: [ (self selectorsMessage value: aClass class) do: [ :sel | aCollection add: (Array with: aClass class with: sel) ] ]
		ifFalse: [ 
			(self selectorsMessage value: aClass class)
				do: [ :sel | 
					(selectorsParser matches: sel asString) not
						ifTrue: [ aCollection add: (Array with: aClass class with: sel) ] ].
			(self selectorsMessage = #localSelectors)
				ifTrue: [
					(aClass class allSelectors difference: (aClass class localSelectors)) do: [:each | aCollection add: (Array with: aClass class with: each)] ] ].
	^ aCollection