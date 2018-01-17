class parser generation
generateReceiverClassParser: aParserNode
	| aNameParser classParser |
	aNameParser := aParserNode at: 1.
	classParser := #word asParser plus, (#space asParser plus), (('subclass:' asParser) / ('variableByteSubclass:' asParser) / ('variableSubclass:' asParser) / ('variableWordSubclass:' asParser) / ('weakSubclass:' asParser) ), (#space asParser plus), $# asParser, aNameParser, (#blank asParser | #newline asParser).
	"subclassParser := aNameParser, #space asParser plus, 'subclass:' asParser."
	(aParserNode at: 3) notNil
		ifTrue: [ | matchedClasses subclassParser |
			matchedClasses := (SmalltalkImage current allClasses) select: [:each |
				classParser matches: each definition].
			matchedClasses do: [:each |
				each allSubclasses do: [:s | classParser := classParser / s definition asParser]].
			^classParser]
		ifFalse: [^classParser]
	