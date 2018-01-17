class parser generation
generateReceiverMetaclassParser: aParserNode
	| aNameParser metaclassParser |
	aNameParser := aParserNode at: 1.
	metaclassParser := aNameParser , #space asParser plus , 'class' asParser , (#blank asParser | #newline asParser).
	(aParserNode at: 3) notNil
		ifFalse: [ ^ metaclassParser ]
		ifTrue: [ 
			| matchedMetaclasses |
			matchedMetaclasses := SmalltalkImage current allClasses
				collect: [ :each | each class ]
				thenSelect: [ :each | metaclassParser matches: each definition ].
			matchedMetaclasses
				do: [ :each | each allSubclasses do: [ :s | metaclassParser := metaclassParser / s definition asParser ] ].
			^ metaclassParser ]